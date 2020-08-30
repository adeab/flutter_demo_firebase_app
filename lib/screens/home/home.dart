import 'package:flutter/material.dart';
import 'package:test_app_firebase/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.logOut();
            },
            label: Text('Sign Out'),
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
