import 'dart:io';
import 'dart:async';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';
import 'package:Tracker/models/smartlocation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HeatMapPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HeatMapPages();
  }
}

class _HeatMapPages extends State<HeatMapPages> {
  //----------------------------------------------------------------------------
  Completer<GoogleMapController> _controller = Completer();
  final Set<Heatmap> _heatmaps = {};
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.240652812500006, 103.25703583333335),
    zoom: 18,
  );
  LatLng _heatmapLocation;
  //----------------------------------------------------------------------------
  List<SmartLocation> _Location;

  double latitude;
  double longitude;
  String frequency;
  String rssi;
  String rssiP;
  String snr;

  @override
  void initState() {
    super.initState();
    Services.getData().then((Location) {
      setState(() {
        _Location = Location;
        if (_Location != null) {
          for (int i = 0; i < _Location.length; i++) {
            SmartLocation data = _Location[i];
            latitude = data.latitude;
            longitude = data.longitude;
            frequency = data.frequency;
            rssi = data.rssi;
            rssiP = data.rssiP;
            snr = data.snr;
            //----------------------------------------------------------------------------
            setState(() {
              _heatmaps.add(Heatmap(
                  heatmapId: HeatmapId(_heatmapLocation.toString()),
                  points: _createPoints(),
                  radius: 40,
                  visible: true,
                  gradient: HeatmapGradient(
                      colors: <Color>[Colors.green, Colors.red],
                      startPoints: <double>[0.2, 0.8])));
            });
            //----------------------------------------------------------------------------
          }
        }
      });
    });
  }
//----------------------------------------------------------------------------

  //heatmap generation helper functions
  List<WeightedLatLng> _createPoints() {
    final List<WeightedLatLng> points = <WeightedLatLng>[];
    if (_Location != null) {
      for (int i = 0; i < _Location.length; i++) {

        SmartLocation data = _Location[i];
        latitude = data.latitude;
        longitude = data.longitude;
        frequency = data.frequency;
        rssi = data.rssi;
        rssiP = data.rssiP;
        snr = data.snr;
        _heatmapLocation = LatLng(latitude, longitude);
        points.add(_createWeightedLatLng(
            latitude, longitude, int.parse(rssiP)));
      }
    }
    //Can create multiple points here

    return points;
  }

  WeightedLatLng _createWeightedLatLng(double lat, double lng, int weight) {
    return WeightedLatLng(point: LatLng(lat, lng), intensity: weight);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        heatmaps: _heatmaps,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
  Future<void> _go(CameraPosition CameraPosition) async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition));
  }
//----------------------------------------------------------------------------
}

class Services {
  static const String url = 'http://202.28.34.197/LoRaTracker/SmartLocation/10';

  static Future<List<SmartLocation>> getData() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<SmartLocation> data = smartLocationFromJson(response.body);
        return data;
      } else {
        return List<SmartLocation>();
      }
    } catch (e) {
      return List<SmartLocation>();
    }
  }
}
