import 'package:flutter/material.dart';

class ProfileButtonHeader extends StatelessWidget {
  IconData icono;
  double size;
  bool isActive;
  bool isMini;

  ProfileButtonHeader(this.icono, this.isMini, this.isActive);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: isMini ? 40 : 80,
        child: FloatingActionButton(
            foregroundColor: Colors.blue,
            backgroundColor: isActive ? Colors.white : Colors.white38,
            onPressed: () {},
            child: Icon(icono)));
  }
}
