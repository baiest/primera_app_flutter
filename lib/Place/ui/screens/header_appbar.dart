import 'package:flutter/material.dart';
import 'package:nueva_app/widgets/gradiant_back.dart';
import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        GradiantBack(title: "Popular", size: 250.0),
        CardImageList(),
      ],
    );
  }
}
