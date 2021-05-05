import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nueva_app/Place/ui/widgets/card_image.dart';
import 'package:nueva_app/Place/ui/widgets/title_input_location.dart';
import 'package:nueva_app/widgets/gradiant_back.dart';
import 'package:nueva_app/widgets/text_input.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerTitlePlace = TextEditingController();
    final _controllerdescription = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradiantBack(
            title: "Add a new Place",
            size: 250.0,
            left: 60.0,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0),
                child: SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 60.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: "assets/img/beach_palm.jpeg",
                    iconData: Icons.camera,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: 'Title',
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: 'Description',
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerdescription,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add Location",
                    iconData: Icons.location_on,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
