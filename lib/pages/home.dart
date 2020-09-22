import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePages createState() => _HomePages();
}

class _HomePages extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('Latitude'),
                          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('Longitude'),
                          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('Frequency'),
                          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),Container(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('rssi'),
                          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),Container(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('snr'),
                          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),Container(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('Time'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
