import 'package:flutter/material.dart';
import 'photo_card.dart';

class PhotoListTrip extends StatelessWidget {
  String description =
      "Esto es un pequeño texto de prueba que aparecera en la tarjeta para verificar como luce";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(top: 330.0),
      child: ListView(children: [
        PhotoCard('assets/img/mountain.jpeg', "Monte Everest", description,
            "Stepts 152.155.54"),
        PhotoCard('assets/img/mountain_stars.jpeg', "Noche Estrellada",
            description, "Stepts 18.545.245"),
        PhotoCard('assets/img/river.jpeg', "Rio de Janeiro", description,
            "Stepts 36.215.596"),
        PhotoCard('assets/img/beach.jpeg', "Isla Perdida", description,
            "Stepts 25.035.685"),
      ]),
    );
  }
}
