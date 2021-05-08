import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nueva_app/Place/model/place.dart';
import 'package:nueva_app/Place/repository/firebase_storage_repository.dart';
import 'package:nueva_app/User/model/user.dart' as ModelUser;
import 'package:nueva_app/User/repository/auth_repository.dart';
import 'package:nueva_app/User/repository/cloud_firestore_api.dart';
import 'package:nueva_app/User/repository/cloud_firestore_repository.dart';
import 'package:nueva_app/User/ui/widgets/photo_card.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  //Flujo de datos - Stream
  //Stream - Firebase

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;
  Future<User> get currentUser async => FirebaseAuth.instance.currentUser;
  //Casos uso
  //1. SignIn a la aplicacion Google
  Future<UserCredential> signIn() {
    return _auth_repository.signInFirebase();
  }

  void signOut() {
    _auth_repository.signOut();
  }

  //2. regitrar usuario en BD
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(ModelUser.User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  //3. registrar place del usuario
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  final _firebaseStorageRepository = FirebaseStorageRepository();
  UploadTask uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  Stream<QuerySnapshot> _placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .snapshots();
  Stream<QuerySnapshot> get placesStream => _placesListStream;

  List<PhotoCard> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore
      .instance
      .collection(CloudFirestoreAPI().PLACES)
      .where("userOwner",
          isEqualTo: FirebaseFirestore.instance
              .doc("${CloudFirestoreAPI().USERS}/$uid"))
      .snapshots();
  @override
  void dispose() {}
}
