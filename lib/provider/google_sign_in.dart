import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/provider/Auth_Page.dart';
import 'package:flutter_auth/provider/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Screens/HomePage/home_screen.dart';

class GoogleSignInProvider extends ChangeNotifier {
  GoogleSignIn googleSignIn = GoogleSignIn();
  Future googleLogin(context) async {
    // creating firebase instance
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    try {
      if (googleSignInAccount == null) return;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await FirebaseAuth.instance.signInWithCredential(authCredential);
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (result != null) {
        notifyListeners();
        Navigator.pushNamed(context, RegisterUserCheck.id);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  logout() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
