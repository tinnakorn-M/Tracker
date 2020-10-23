import 'dart:async';
import 'package:Tracker/models/meanlocation.dart';
import 'package:Tracker/models/scopmodel.dart';
import 'package:Tracker/pages/home.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';
import 'package:Tracker/models/smartlocation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class HeatMapPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HeatMapPages();
  }
}

class _HeatMapPages extends State<HeatMapPages> {
  String time;
  double latitude;
  double longitude;
  String frequency;
  String rssi;
  String snr;
  double lat, lng;
  int sf = 7;

  var TappedPoint;

  //----------------------------------------------------------------------------
  final Set<Heatmap> _heatmaps = {};
  LatLng _heatmapLocation;
  List<Marker> myMarker = [];

  //----------------------------------------------------------------------------
  List<SmartLocation> _Location;

  @override
  void initState() {
    super.initState();
    ServicesSmartLocation.getData().then((Smartdata) {
      setState(() {
        _Location = Smartdata;
        //------------------------------cerate Heatmap---------------------------
        _heatmaps.add(Heatmap(
            heatmapId: HeatmapId(_heatmapLocation.toString()),
            points: _createPoints(),
            radius: 50,
            visible: true,
            gradient: HeatmapGradient(
                colors: <Color>[Colors.green, Colors.red],
                startPoints: <double>[0.2, 0.9])));
        //------------------------------cerate Heatmap---------------------------
      });
    });
  }

  //---------------------------------cerate Heatmap------------------------------
  //heatmap generation helper functions
  List<WeightedLatLng> _createPoints() {
    final List<WeightedLatLng> points = <WeightedLatLng>[];
    if (_Location != null) {
      for (int i = 0; i < _Location.length; i++) {
        SmartLocation data = _Location[i];
        _heatmapLocation = LatLng(data.latitude, data.longitude);
        points.add(_createWeightedLatLng(
            data.latitude, data.longitude, int.parse(data.rssiP)));
      }
    }
    return points;
  }

  WeightedLatLng _createWeightedLatLng(double lat, double lng, int weight) {
    return WeightedLatLng(point: LatLng(lat, lng), intensity: weight);
  }

  //---------------------------------cerate Heatmap------------------------------
  //-------------------------------------return----------------------------------
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, childm, scopModel) => new Scaffold(
              appBar: AppBar(
                title: Text('Heatmap'),
              ),
              body: GoogleMap(
                mapType: MapType.hybrid,
                //แสดงแผนที่รูปแบบดาวเทียม
                initialCameraPosition: CameraPosition(
                    target: LatLng(16.240551111111113, 103.25667333333334),
                    zoom: 18.0),
                markers: Set.from(myMarker),
                onTap: _handleTap,
                heatmaps: _heatmaps,
              ),
            ));
  }

  //-------------------------------------return----------------------------------

  //-----------------------------------Marker------------------------------------
  _handleTap(LatLng tappedPoint) async {
    AppModel scopemodel = ScopedModel.of(context);
    double lat = tappedPoint.latitude, lng = tappedPoint.longitude;
    // print(lat);
    // print(lng);
    String url =
        //http://202.28.34.197/LoRaTracker/SmartMeanLocation/16.240449/103.256952/16.2466187/103.2521929/16.240135/103.257503/5
        'http://202.28.34.197/LoRaTracker/SmartMeanLocation/16.240449/103.256952/16.2466187/103.2521929/$lat/$lng/7/5';
    try {
      final response = await http.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final List<MeanLocation> data = meanLocationFromJson(response.body);
        MeanLocation dataStr = data[0];
        scopemodel.meantime = dataStr.time;
        scopemodel.latitude = dataStr.latitude;
        scopemodel.longitude = dataStr.longitude;
        scopemodel.frequency = dataStr.frequency;
        scopemodel.rssi = dataStr.rssi;
        scopemodel.min_rssi = dataStr.minRssi;
        scopemodel.max_rssi = dataStr.maxRssi;
        scopemodel.snr = dataStr.snr;
        scopemodel.min_snr = dataStr.minRssi;
        scopemodel.max_snr = dataStr.maxSnr;

        setState(() {
          myMarker = [];
          myMarker.add(Marker(
            markerId: MarkerId(tappedPoint.toString()),
            position: tappedPoint,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(
                anchor: const Offset(0.5, 0.0),
                title: 'ค่าเฉลี่ยความแรงของสัญญาณ',
                snippet: 'lat:' +
                    lat.toStringAsFixed(6) +
                    ', lng:' +
                    lng.toStringAsFixed(6),
                onTap: () {
                  Navigator.pushNamed(context, '/home-page');
                }),
          ));
        });
      } else {}
    } catch (e) {}
  }
//-----------------------------------Marker------------------------------------
}

//------------------------------------Service------------------------------------
class ServicesSmartLocation {
  static const String url =
      'http://202.28.34.197/LoRaTracker/SmartLocation/7/10';

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

class ServicesMeanLocation {
  static const String url =
      'http://202.28.34.197/LoRaTracker/meanLocation/16.240584/103.2569/0.00005';

  static Future<List<MeanLocation>> getData() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<MeanLocation> data = meanLocationFromJson(response.body);
        return data;
      } else {
        return List<MeanLocation>();
      }
    } catch (e) {
      return List<MeanLocation>();
    }
  }
}
//------------------------------------Service------------------------------------
