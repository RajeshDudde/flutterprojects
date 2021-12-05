import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/models/user.dart';
//import 'package:firstapp/screens/authenticate/authenticate.dart';
//import 'package:firstapp/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final Authenticate _a = Authenticate();
  // create user obj based on firebase user
  Users? _userFromFirebaseUser(User? user) {
    // ignore: unnecessary_null_comparison

    // ignore: unnecessary_null_comparison
    return user != null ? Users(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Users?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      // ignore: avoid_print
      print(result);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // create a new document for the user with the uid
      //  await DatabaseService(uid: user!.uid)
      //.updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      // ignore: avoid_print
      return await _auth.signOut();
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
      return null;
    }
  }
}
