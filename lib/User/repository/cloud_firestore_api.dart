import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nueva_app/Place/model/place.dart';
import 'package:nueva_app/Place/ui/widgets/card_image.dart';
import 'package:nueva_app/User/model/user.dart' as Model;
import 'package:nueva_app/User/ui/widgets/photo_card.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(Model.User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    User user = _auth.currentUser;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': _db.doc("$USERS/${user.uid}") //reference
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        //ID Referencia Array
        DocumentReference refUser = _db.collection(USERS).doc(user.uid);
        refUser.update({
          'myPlaces': FieldValue.arrayUnion([_db.doc("$PLACES/${snapshot.id}")])
        });
      });
    });
  }

  List<PhotoCard> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<PhotoCard> profilePlaces = [];

    placesListSnapshot.forEach((p) {
      profilePlaces.add(PhotoCard(Place(
        name: p.data()['name'],
        description: p.data()['description'],
        likes: p.data()['likes'],
        urlImage: p.data()['urlImage'],
      )));
    });

    return profilePlaces;
  }

  List<CardImageWithFabIcon> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> placesCard = [];

    IconData iconData = Icons.favorite_border_outlined;
    placesListSnapshot.forEach((p) {
      placesCard.add(CardImageWithFabIcon(
        pathImage: p.data()['urlImage'],
        height: 200.0,
        width: 200.0,
        right: 20.0,
        internet: true,
        onPressedFabIcon: () {
          print("Presionado: ${p.id}");
          likePlace(p.id);
        },
        iconData: iconData,
      ));
    });

    return placesCard;
  }

  Future likePlace(String idPlace) async {
    await _db.collection(PLACES).doc(idPlace).get().then((DocumentSnapshot ds) {
      print("Datos ${ds.data()}");
      int likes = ds.data()['likes'];
      _db.collection(PLACES).doc(idPlace).update({'likes': likes + 1});
    });
  }
}
