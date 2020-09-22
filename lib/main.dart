import 'package:Tracker/pages/home.dart';
import 'package:Tracker/pages/launcher.dart';
import 'package:Tracker/pages/maps.dart';
import 'package:flutter/material.dart';
import 'pages/heatmap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.purple,
        textTheme: TextTheme(body1: TextStyle(color: Colors.pink)),
      ),
      title: 'First Flutter App',
      initialRoute: '/', // สามารถใช้ home แทนได้
      routes: {
        LauncherPages.routeName: (context) => LauncherPages(),
      },
    );
  }
}
