import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationPages extends StatefulWidget {
  @override
  _LocationPages createState() => _LocationPages();
}

class _LocationPages extends State<LocationPages> {
  double lat, lng;
  List<Marker> myMarker = [];

  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  //-------------------------lat lng on init-------------------------------------
  Future<Null> findLatLng() async {
    LocationData locationData = await findLocationData();
    lat = locationData.latitude;
    lng = locationData.longitude;
    print('lat $lat, lng $lng');
  }

  Future<LocationData> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }
  //-------------------------lat lng on init-------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid, //แสดงแผนที่รูปแบบดาวเทียม
        initialCameraPosition: CameraPosition(
            target: LatLng(16.240652812500006, 103.25703583333335), zoom: 15.0),
        markers: Set.from(myMarker),
        onTap: _handleTab,
      ),
    );
  }

  _handleTab(LatLng tappedPoint) {
    print(tappedPoint);
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          onTap: () {
            print('TiN');
          }));
    });
  }
}
