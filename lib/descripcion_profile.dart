import 'package:flutter/material.dart';

class DescripcionProfile extends StatelessWidget {
  String pathImage;
  String nombre;
  String correo;
  DescripcionProfile(this.pathImage, this.nombre, this.correo);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final descripcionNombre = Container(
      margin: EdgeInsets.only(top: 130.0),
      child: Text(
        nombre,
        style:
            TextStyle(fontFamily: "Lato", fontSize: 25.0, color: Colors.white),
      ),
    );
    final descripcionCorreo = Container(
      child: Text(correo,
          style: TextStyle(
              fontFamily: "Lato", fontSize: 14.0, color: Colors.grey)),
    );

    final descripcion = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [descripcionNombre, descripcionCorreo],
    );
    final foto = Container(
      margin: EdgeInsets.only(left: 20.0, top: 60.0, right: 20),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.white),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return Container(
        height: 250.0,
        child: Row(
          children: [foto, descripcion],
        ));
  }
}
