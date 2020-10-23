import 'package:Tracker/models/meanlocation.dart';
import 'package:Tracker/models/scopmodel.dart';
import 'package:Tracker/pages/heatmap.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';
import 'package:location/location.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class HomePages extends StatefulWidget {
  @override
  _HomePages createState() => _HomePages();
}

class _HomePages extends State<HomePages> {
  List<MeanLocation> _MeanLocation;
  MeanLocation data;
  MeanLocation dataStr;
  String _time;
  double _latitude;
  double _longitude;
  String _frequency;
  String _rssi;
  String _snr;
  double lat, lng;

  @override
  void initState() {
    super.initState();
    setState(() {
      findLatLng();
    });
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
    return ScopedModelDescendant<AppModel>(
        builder: (context, childm, scopModel) => Scaffold(
              appBar: AppBar(
                title: Text('Home'),
              ),
              body: Container(
                color: Colors.white,
                child: Center(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.latitude != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('latitude'),
                                      subtitle:
                                          Text(scopModel.latitude.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('longitude'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.longitude != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('longitude'),
                                      subtitle:
                                          Text(scopModel.longitude.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('longitude'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.frequency != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('frequency'),
                                      subtitle:
                                          Text(scopModel.frequency.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('frequency'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.rssi != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('rssi'),
                                      subtitle: Text(scopModel.rssi.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('rssi'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.min_rssi != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('min rssi'),
                                      subtitle:
                                          Text(scopModel.min_rssi.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('min rssi'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.max_rssi != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('max rssi'),
                                      subtitle:
                                          Text(scopModel.max_rssi.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('max rssi'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.snr != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('snr'),
                                      subtitle: Text(scopModel.snr.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('snr'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.min_snr != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('min snr'),
                                      subtitle:
                                          Text(scopModel.min_snr.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('min snr'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: (scopModel.max_snr != null)
                            ? Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('max snr'),
                                      subtitle:
                                          Text(scopModel.max_snr.toString()),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('max snr'),
                                      subtitle: Text(''),
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
