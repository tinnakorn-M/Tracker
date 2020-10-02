import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';


class MapPages extends StatefulWidget {
  @override
  _MapPages createState() => _MapPages();
}

class _MapPages extends State<MapPages> {
  Completer<GoogleMapController> _controller = Completer();
  var _currentLocation = 0;

  static final CameraPosition center =
  _camPos(16.240652812500006, 103.25703583333335, 15.0);
  static final CameraPosition location1 =
  _camPos(17.240652812500006, 103.25703583333335, 15.0);
  static final CameraPosition location2 =
  _camPos(18.240652812500006, 103.25703583333335, 15.0);

  static CameraPosition _camPos(double lat, long, zoom) {
    return CameraPosition(
      target: LatLng(lat, long),
      zoom: zoom,
    );
  }

  Future<void> _go(CameraPosition CameraPosition) async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: center,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
