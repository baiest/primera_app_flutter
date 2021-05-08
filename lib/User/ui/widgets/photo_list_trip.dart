import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nueva_app/Place/model/place.dart';
import 'package:nueva_app/User/bloc/bloc_user.dart';
import 'package:nueva_app/User/model/user.dart';
import 'photo_card.dart';

class PhotoListTrip extends StatelessWidget {
  User user;
  UserBloc userBloc;
  PhotoListTrip({Key key, this.user});
  static String description_place =
      "Esto es un pequeño texto de prueba que aparecera en la tarjeta para verificar como luce";
  List<Place> places = [
    Place(
      urlImage: 'assets/img/mountain.jpeg',
      name: "Monte Everest",
      description: description_place,
      likes: 4,
    ),
    Place(
      urlImage: 'assets/img/beach.jpeg',
      name: "Rio de Janeiro",
      description: description_place,
      likes: 20,
    ),
    Place(
      urlImage: 'assets/img/mountain_stars.jpeg',
      name: "Noche Estrellada",
      description: description_place,
      likes: 15,
    ),
    Place(
      urlImage: 'assets/img/river.jpeg',
      name: "Isla Perdida",
      description: description_place,
      likes: 12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    // TODO: implement build
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(top: 330.0),
      child: StreamBuilder(
        stream: userBloc.myPlacesListStream(user.uid),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot != null) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ListView(
                    children: userBloc.buildMyPlaces(snapshot.data.docs));
              case ConnectionState.active:
                return ListView(
                    children: userBloc.buildMyPlaces(snapshot.data.docs));
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator());
              default:
                return ListView(
                    children: userBloc.buildMyPlaces(snapshot.data.docs));
            }
          }
        },
      ),
    );
  }
}
