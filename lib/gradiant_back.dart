import 'package:flutter/material.dart';

class GradiantBack extends StatelessWidget {
  String title = "Popular";
  double size;
  GradiantBack(this.title, this.size);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: size,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF4268D3),
                Color(0xFF584cd1),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Lato"),
      ),
      alignment: Alignment(-0.9, -0.8),
    );
  }
}
