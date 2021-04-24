import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nueva_app/home_trips.dart';
import 'package:nueva_app/profile_trips.dart';
import 'package:nueva_app/search_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        bottomNavigationBar: CupertinoTabScaffold(
      tabBar:
          CupertinoTabBar(backgroundColor: Colors.white.withAlpha(70), items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) => HomeTrips(),
            );
            break;
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) => SearchTrips(),
            );
            break;
          case 2:
            return CupertinoTabView(
              builder: (BuildContext context) => ProfileTrips(),
            );
            break;
        }
      },
    ));
  }
}
