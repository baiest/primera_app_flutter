import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nueva_app/User/model/user.dart' as ModelUser;
import 'package:nueva_app/platzi_trips_cupertino.dart';
import 'package:nueva_app/widgets/button_green.dart';
import 'package:nueva_app/widgets/gradiant_back.dart';
import 'package:nueva_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot - data - Object user
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradiantBack(title: "", size: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome \n this is your travel App",
                  style: TextStyle(
                    fontSize: 27.0,
                    fontFamily: 'Lato',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((UserCredential user) {
                    userBloc.updateUserData(ModelUser.User(
                      uid: user.user.uid,
                      name: user.user.displayName,
                      email: user.user.email,
                      photoURL: user.user.photoURL,
                    ));
                    print("Informacion mandad a db");
                  });
                },
                altura: 50.0,
                anchura: 300.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
