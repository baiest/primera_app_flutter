import 'package:flutter/material.dart';
import 'header_profile.dart';
import 'photo_list_trip.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //O: implement build
    return Stack(
      children: [HeaderProfile(), PhotoListTrip()],
    );
  }
}
