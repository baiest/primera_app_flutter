import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nueva_app/Place/model/place.dart';
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

  List<PhotoCard> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
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
}
