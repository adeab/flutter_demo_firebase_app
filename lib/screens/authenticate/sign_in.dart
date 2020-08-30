import 'package:test_app_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleScreen;
  SignIn({this.toggleScreen});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authenticate = AuthService();
  final _fKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text('Login'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleScreen();
              },
              icon: Icon(Icons.account_box),
              label: Text('Register'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (val) => val.isEmpty ? 'Cannot Be Empty' : null,
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                print(email);
                print(password);
              },
              color: Colors.green,
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )),

        // child: RaisedButton(
        //   onPressed: () async {
        //     dynamic result = await _authenticate.signInAnnon();
        //     if (result == null) {
        //       print('error');
        //     } else {
        //       print('Signed In');
        //       print(result.user_id);
        //     }
        //   },
        //   child: Text("Sign In Annonymously"),
        // ),
      ),
    );
  }
}
