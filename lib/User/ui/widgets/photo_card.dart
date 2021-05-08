import 'package:flutter/material.dart';
import 'package:nueva_app/Place/model/place.dart';
import 'photo_description_card.dart';

class PhotoCard extends StatelessWidget {
  Place place;

  PhotoCard(this.place);
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
                fit: BoxFit.cover, image: NetworkImage(place.urlImage)),
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
      children: [
        card,
        PhotoDescriptionCard(place.name, place.description, place.likes)
      ],
    );
  }
}
