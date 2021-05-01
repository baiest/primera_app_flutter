import 'package:flutter/cupertino.dart';
import 'package:nueva_app/User/model/user.dart';

class Place {
  String id;
  String name;
  String where;
  String urlImage;
  int likes;
  User userOwner;

  Place(
      {Key key,
      @required this.name,
      @required this.where,
      @required this.urlImage,
      this.likes,
      @required this.userOwner});
}
