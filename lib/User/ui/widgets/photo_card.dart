import 'package:flutter/material.dart';
import 'photo_description_card.dart';

class PhotoCard extends StatelessWidget {
  String pathImage;
  String titulo;
  String description;
  String stepts;

  PhotoCard(this.pathImage, this.titulo, this.description, this.stepts);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
        height: 250.0,
        width: 400.0,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0, top: 20.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(pathImage)),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0,
                  offset: Offset(0.0, 5.0))
            ]));

    return Stack(
      alignment: Alignment(0.0, 0.9),
      children: [card, PhotoDescriptionCard(titulo, description, stepts)],
    );
  }
}
