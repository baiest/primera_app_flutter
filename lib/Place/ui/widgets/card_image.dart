import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final String pathImage;
  final double height;
  final double width;
  final double right;
  final IconData iconData;
  final bool internet;
  final VoidCallback onPressedFabIcon;

  CardImageWithFabIcon(
      {Key key,
      @required this.pathImage,
      this.width = 350.0,
      this.height = 250.0,
      this.right = 0.0,
      this.internet = false,
      @required this.onPressedFabIcon,
      @required this.iconData});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final card = Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(top: 10.0, right: right),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                //image: AssetImage(pathImage),
                image: internet
                    ? CachedNetworkImageProvider(pathImage)
                    : pathImage.contains('assets')
                        ? AssetImage(pathImage)
                        : FileImage(File(pathImage))),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            shape: BoxShape.rectangle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 7.0))
            ]));

    return Stack(alignment: Alignment(0.9, 1.1), children: [
      card,
      FloatingActionButtonGreen(
        iconData: iconData,
        onPressed: onPressedFabIcon,
      )
    ]);
  }
}
