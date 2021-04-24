import 'package:flutter/material.dart';
import 'package:nueva_app/gradiant_back.dart';
import 'card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [GradiantBack("Popular", 250.0), CardImageList()],
    );
  }
}
