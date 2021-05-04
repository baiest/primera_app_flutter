import 'package:flutter/material.dart';
import 'package:nueva_app/widgets/gradiant_back.dart';
import 'package:nueva_app/widgets/text_input.dart';

class AddPlaceScreen extends StatefulWidget {
  FileImage image;

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
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      size: 50.0,
                      color: Colors.white,
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
            margin: EdgeInsets.only(top: 350.0, bottom: 20.0),
            child: ListView(
              children: [
                Container(),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
