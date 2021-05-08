import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nueva_app/User/bloc/bloc_user.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs));
            case ConnectionState.done:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs));
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
        /*[
          CardImageWithFabIcon(
              height: 250.0,
              width: 250.0,
              right: 20.0,
              pathImage: 'assets/img/beach_palm.jpeg',
              iconData: Icons.favorite_border),
          CardImageWithFabIcon(
              height: 250.0,
              width: 250.0,
              right: 20.0,
              pathImage: 'assets/img/beach.jpeg',
              iconData: Icons.favorite_border),
          CardImageWithFabIcon(
              height: 250.0,
              width: 250.0,
              right: 20.0,
              pathImage: 'assets/img/mountain_stars.jpeg',
              iconData: Icons.favorite_border),
          CardImageWithFabIcon(
              height: 250.0,
              width: 250.0,
              right: 20.0,
              pathImage: 'assets/img/mountain.jpeg',
              iconData: Icons.favorite_border),
          CardImageWithFabIcon(
              height: 250.0,
              width: 250.0,
              right: 20.0,
              pathImage: 'assets/img/river.jpeg',
              iconData: Icons.favorite_border),
          CardImageWithFabIcon(
              height: 250.0,
              width: 250.0,
              right: 20.0,
              pathImage: 'assets/img/sunset.jpeg',
              iconData: Icons.favorite_border),
        ],*/
      ),
    );
  }

  Widget listViewPlaces(List<CardImageWithFabIcon> placesCard) {
    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: placesCard);
  }
}
