import 'package:flutter/material.dart';
import 'package:test_app_firebase/services/auth.dart';

class SignUp extends StatefulWidget {
  final Function toggleScreen;
  SignUp({this.toggleScreen});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authenticate = AuthService();
  final _fKey = GlobalKey<FormState>();

  String email;
  String password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text('Sign Up'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleScreen();
              },
              icon: Icon(Icons.account_box),
              label: Text('Login'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _fKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? 'Field Cannot be empty!' : null,
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
                  validator: (val) => val.length < 6
                      ? 'Password needs to be atleast 6 character long'
                      : null,
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
                  onPressed: () async {
                    if (_fKey.currentState.validate()) {
                      dynamic result =
                          await _authenticate.register(email, password);
                      if (result == null) {
                        print('Hosse na');
                        setState(() {
                          error =
                              'Something went wrong, please check if the given information are valid';
                        });
                      }
                    }
                  },
                  color: Colors.green,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Colors.blue[300],
                  onPressed: () async {
                    dynamic result = await _authenticate.signInAnnon();
                    if (result == null) {
                      print('error');
                    } else {
                      print('Signed In');
                      print(result.user_id);
                    }
                  },
                  child: Text('Sign In Annonymously',
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(error,
                    style: TextStyle(
                      color: Colors.red,
                    )),
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
