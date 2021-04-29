import 'package:flutter/material.dart';
import 'package:nueva_app/User/model/user.dart';

class DescripcionProfile extends StatelessWidget {
  User user;
  DescripcionProfile(this.user);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final descripcionNombre = Container(
      margin: EdgeInsets.only(top: 110.0),
      child: Text(
        user.name,
        style:
            TextStyle(fontFamily: "Lato", fontSize: 25.0, color: Colors.white),
      ),
    );
    final descripcionCorreo = Container(
      child: Text(user.email,
          style: TextStyle(
              fontFamily: "Lato", fontSize: 14.0, color: Colors.grey)),
    );

    final descripcion = Container(
      width: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [descripcionNombre, descripcionCorreo],
      ),
    );
    final foto = Container(
      margin: EdgeInsets.only(left: 20.0, top: 40.0, right: 20),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.white),
          image: DecorationImage(
            fit: BoxFit.cover,
            //image: AssetImage(user.photoURL),
            image: NetworkImage(user.photoURL),
          )),
    );

    return Container(
        height: 250.0,
        child: Row(
          children: [foto, descripcion],
        ));
  }
}
