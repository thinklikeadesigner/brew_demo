import 'package:brew_demo_for_user_db_and_auth/models/user_class.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //return user object based on firebase user
  UserClass _userFromFirebaseUser(User user) {
    return user != null ? UserClass(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserClass> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

//sign in anon

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }

//signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }
}
