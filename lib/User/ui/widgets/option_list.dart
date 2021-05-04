import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nueva_app/User/bloc/bloc_user.dart';
import 'package:nueva_app/User/ui/screens/profile_button_header.dart';
import 'package:nueva_app/Place/ui/screens/add_place_screen.dart';

class OptionList extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of(context);

    return Container(
        margin: EdgeInsets.only(
          top: 250.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //ProfileButtonHeader(Icons.bookmark_border, true, true),
            ProfileButtonHeader(Icons.vpn_key_outlined, true, false, () => {}),
            ProfileButtonHeader(Icons.add, false, true, () {
              FileImage image;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                  return AddPlaceScreen(
                  image: image,
                );
              }));
            }),
            ProfileButtonHeader(
                Icons.exit_to_app, true, false, () => {userBloc.signOut()}),
            //ProfileButtonHeader(Icons.person_outline, true, false),
          ],
        ));
  }
}
