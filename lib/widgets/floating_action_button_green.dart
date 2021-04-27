import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void onPressedFav() {
      setState(() {
        this.favorite = !this.favorite;
      });
      /*Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Agregaste  tus Favoritos"),
      ));*/
    }

    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(this.favorite ? Icons.favorite : Icons.favorite_border),
    );
  }
}
