import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nueva_app/User/bloc/bloc_user.dart';
import 'package:nueva_app/User/model/user.dart';
import '../widgets/descripcion_profile.dart';
import 'package:nueva_app/widgets/gradiant_back.dart';
import '../widgets/option_list.dart';
import 'package:nueva_app/User/model/user.dart';

class HeaderProfile extends StatelessWidget {
  UserBloc userBloc;

  User user;
  String pathImage = "assets/img/spider.png";
  String nombre = "Juan Ballesteros";
  String correo = "juanballesteros2001@gmail.com";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.none:
            return CircularProgressIndicator();
            break;
          case ConnectionState.active:
            return showProfileData(snapshot);
            break;
          case ConnectionState.done:
            return showProfileData(snapshot);
            break;
        }
      },
    );
    /*return Stack(
      children: [
        GradiantBack("Profile", 550.0),
        DescripcionProfile(pathImage, nombre, correo),
        OptionList()
      ],
    );*/
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return Container(
          height: 250.0,
          child: Row(
            children: [
              CircularProgressIndicator(),
              Text("No se pudo cargar la información")
            ],
          ));
    } else {
      print("Logeado");
      user = User(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);
      return Stack(
        children: [
          GradiantBack("Profile", 550.0),
          DescripcionProfile(user),
          OptionList()
        ],
      );
    }
  }
}
