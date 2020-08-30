import 'package:provider/provider.dart';
import 'package:test_app_firebase/models/user.dart';
import 'package:test_app_firebase/screens/authenticate/authenticate.dart';
import 'package:test_app_firebase/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userdetail = Provider.of<User>(context);
    print(userdetail);

    //Return either home or authenticate widget
    if (userdetail != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
