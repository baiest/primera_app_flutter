import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  double altura;
  double anchura;

  ButtonGreen(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.altura,
      this.anchura});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonGreen();
  }
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
          child: Center(
              child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
              color: Colors.white,
            ),
          )),
          margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          height: widget.altura,
          width: widget.anchura,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFa7ff84),
                  Color(0xFF1cbb78),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp),
          )),
    );
  }
}
