import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  String pathImage = "assets/img/sebas.jpg";
  String name = "Sebastian Tamayo";
  String details = "1 review 5 photos";
  String comment = "Very nice";
  @override
  Review(this.pathImage, this.name, this.details, this.comment);

  Widget build(BuildContext context) {
    // TODO: implement build

    final userComment = Container(
      margin: EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        comment,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 15.0,
        ),
      ),
    );
    final userInfo = Container(
      margin: EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        details,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3aa5a7)),
      ),
    );
    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        name,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );
    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[userName, userInfo, userComment],
    );
    final foto = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return Row(
      children: <Widget>[foto, userDetails],
    );
  }
}
