import 'package:flutter/material.dart';

class ProfileButtonHeader extends StatefulWidget {
  final VoidCallback onPressed;
  IconData icono;
  double size;
  bool isActive;
  bool isMini;

  ProfileButtonHeader(this.icono, this.isMini, this.isActive, this.onPressed);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileButtonHeader();
  }
}

class _ProfileButtonHeader extends State<ProfileButtonHeader> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: widget.isMini ? 40 : 80,
        child: FloatingActionButton(
          foregroundColor: Colors.blue,
          backgroundColor: widget.isActive ? Colors.white : Colors.white38,
          onPressed: widget.onPressed,
          child: Icon(widget.icono),
          heroTag: null,
        ));
  }
}
