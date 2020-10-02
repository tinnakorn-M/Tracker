import 'package:Tracker/models/scopmodel.dart';
import 'package:Tracker/pages/home.dart';
import 'package:Tracker/pages/launcher.dart';
import 'package:Tracker/pages/maps.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'pages/heatmap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final scopModel = AppModel();

  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: scopModel,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.pinkAccent,
          accentColor: Colors.pinkAccent,
          textTheme: TextTheme(body1: TextStyle(color: Colors.pinkAccent)),
        ),
        title: 'Tracker',
        initialRoute: '/', // สามารถใช้ home แทนได้
        routes: {
          LauncherPages.routeName: (context) => LauncherPages(),
          '/home-page': (context) => HomePages(),
        },
      ),
    );
  }
}
