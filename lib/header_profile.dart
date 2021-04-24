import 'package:flutter/material.dart';
import 'package:nueva_app/descripcion_profile.dart';
import 'package:nueva_app/gradiant_back.dart';
import 'option_list.dart';

class HeaderProfile extends StatelessWidget {
  String pathImage = "assets/img/spider.png";
  String nombre = "Juan Ballesteros";
  String correo = "juanballesteros2001@gmail.com";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        GradiantBack("Profile", 550.0),
        DescripcionProfile(pathImage, nombre, correo),
        OptionList()
      ],
    );
  }
}
