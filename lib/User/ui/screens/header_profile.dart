import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nueva_app/User/bloc/bloc_user.dart';
import 'package:nueva_app/User/model/user.dart';
import '../widgets/descripcion_profile.dart';
import 'package:nueva_app/widgets/gradiant_back.dart';
import '../widgets/option_list.dart';

class HeaderProfile extends StatelessWidget {
  User user;

  HeaderProfile({Key key, @required this.user});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Stack(
      children: [
        GradiantBack(title: "Profile", size: 550.0),
        DescripcionProfile(user),
        OptionList()
      ],
    );
  }
}
