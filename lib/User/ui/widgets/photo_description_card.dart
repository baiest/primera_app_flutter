import 'package:flutter/material.dart';
import 'package:nueva_app/widgets/floating_action_button_green.dart';

class PhotoDescriptionCard extends StatelessWidget {
  String tituloCard = "";
  String description = "";
  String stepts = "";

  PhotoDescriptionCard(this.tituloCard, this.description, this.stepts);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final steps = Container(
      margin: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Text(
        stepts,
        style:
            TextStyle(fontFamily: 'Lato', fontSize: 15.0, color: Colors.orange),
      ),
    );
    final descripcion = Container(
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 30.0),
      child: Text(
        description,
        style:
            TextStyle(fontFamily: 'Lato', fontSize: 12.0, color: Colors.grey),
      ),
    );

    final titulo = Container(
      margin: EdgeInsets.only(left: 10.0, top: 5.0),
      child: Text(
        tituloCard,
        style: TextStyle(
            fontFamily: 'Lato', fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );

    final card = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titulo, descripcion, steps],
      ),
    );

    final cardButton = Stack(alignment: Alignment(0.9, 1.5), children: [
      card,
      FloatingActionButtonGreen(iconData: Icons.favorite_outline),
    ]);

    return Container(
        height: 130.0,
        width: 250.0,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black, blurRadius: 20.0, offset: Offset(0.0, 3.0)),
        ]),
        child: cardButton);
  }
}
