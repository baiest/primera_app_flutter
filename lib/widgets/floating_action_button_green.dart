import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen(
      {Key key, @required this.iconData, @required this.onPressed});

  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    /*void onPressedFav() {
      setState(() {
        this.favorite = !this.favorite;
      });
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Agregaste  tus Favoritos"),
      ));
    }*/

    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(this.favorite ? widget.iconData : widget.iconData),
      heroTag: null,
    );
  }
}
