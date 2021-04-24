import 'package:flutter/material.dart';
import 'button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String description;
  double top_margin = 340;

  DescriptionPlace(this.namePlace, this.stars, this.description);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final star_half = Container(
      margin: EdgeInsets.only(top: top_margin, right: 3.0),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2c611),
      ),
    );

    final star_border = Container(
      margin: EdgeInsets.only(top: top_margin, right: 3.0),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2c611),
      ),
    );

    final star = Container(
      margin: EdgeInsets.only(top: top_margin, right: 3.0),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2c611),
      ),
    );
    final title_stars = Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 340.0, left: 20.0, right: 20.0),
            child: Text(
              namePlace,
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.left,
            )),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            star_half,
            star_border,
          ],
        )
      ],
    );

    final text_descripcion = Container(
      margin: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
      child: Text(
        description,
        style: TextStyle(fontFamily: "Lato", fontSize: 15.0),
        textAlign: TextAlign.left,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [title_stars, text_descripcion, ButtonPurple("Navigate")],
    );
  }
}
