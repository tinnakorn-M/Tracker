import 'package:Tracker/models/scopmodel.dart';
import 'package:Tracker/pages/heatmap.dart';
import 'package:Tracker/pages/home.dart';
import 'package:Tracker/pages/maps.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'location.dart';

class LauncherPages extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _LauncherPages();
  }
}

class _LauncherPages extends State<LauncherPages> {
  int _selectedIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    HomePages(),
    // MapPages(),
    HeatMapPages(),
    // LocationPages(),
  ];

  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.pin_drop),
    //   title: Text('Maps'),
    // ),
    BottomNavigationBarItem(
      icon: Icon(Icons.color_lens),
      title: Text('HeatMap'),
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.add_location),
    //   title: Text('Location'),
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, childm, scopModel) => Scaffold(
              body: _pageWidget.elementAt(_selectedIndex),
              bottomNavigationBar: BottomNavigationBar(
                items: _menuBar,
                currentIndex: _selectedIndex,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.grey,
                onTap: _onItemTapped,
              ),
            ));
  }
}
