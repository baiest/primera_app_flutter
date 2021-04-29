import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nueva_app/User/repository/auth_repository.dart';

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

  @override
  void dispose() {}
}
