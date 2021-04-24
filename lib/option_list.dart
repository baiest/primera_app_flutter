import 'package:flutter/material.dart';
import 'package:nueva_app/profile_button_header.dart';

class OptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
        margin: EdgeInsets.only(
          top: 220.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileButtonHeader(Icons.bookmark_border, true, true),
            ProfileButtonHeader(Icons.card_giftcard_outlined, true, false),
            ProfileButtonHeader(Icons.add, false, true),
            ProfileButtonHeader(Icons.mail_outline, true, false),
            ProfileButtonHeader(Icons.person_outline, true, false),
          ],
        ));
  }
}
