import 'package:test_app_firebase/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:test_app_firebase/screens/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignUp = true;
  void toggleScreen() {
    setState(() => showSignUp = !showSignUp);
  }

  @override
  Widget build(BuildContext context) {
    // return showSignUp == true
    //     ? Container(child: SignUp(toggle: toggleScreen))
    //     : Container(child: SignIn(toggle: toggleScreen));
    if (showSignUp == true) {
      return SignUp(toggleScreen: toggleScreen);
    } else {
      return SignIn(toggleScreen: toggleScreen);
    }
  }
}
