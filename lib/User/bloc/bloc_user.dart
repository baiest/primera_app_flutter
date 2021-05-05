import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nueva_app/Place/model/place.dart';
import 'package:nueva_app/User/model/user.dart' as ModelUser;
import 'package:nueva_app/User/repository/auth_repository.dart';
import 'package:nueva_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  //Flujo de datos - Stream
  //Stream - Firebase

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

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

  @override
  void dispose() {}
}
