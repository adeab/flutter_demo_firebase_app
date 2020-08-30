import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app_firebase/models/user.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _getFirebaseUser(FirebaseUser user) {
    return user != null ? User(user_id: user.uid) : null;
  }

  //keep check on login status
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_getFirebaseUser);
  }

  //annonymous sign up
  Future signInAnnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _getFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //email sigh up

  //register with email
  Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _getFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
