import 'package:flutter/material.dart';

class GradiantBack extends StatelessWidget {
  String title = "Popular";
  double size;
  GradiantBack({Key key, this.title, this.size});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    if (size == null) {
      size = heightScreen;
    }

    return Container(
        height: size,
        width: widthScreen,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF584cd1),
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp,
        )),
        child: Stack(
          children: [
            FittedBox(
              fit: BoxFit.none,
              alignment: Alignment(-1.5, -0.8),
              child: Container(
                width: heightScreen,
                height: size,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(heightScreen / 2),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato"),
                )),
          ],
        ));
  }
}
