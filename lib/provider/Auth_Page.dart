import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/Screens/HomePage/home_screen.dart';
import 'package:flutter_auth/Screens/Login/components/login_form.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Registration/registration_screen.dart';
import 'package:flutter_auth/Screens/Registration/Registration_page.dart';
import 'package:flutter_auth/Screens/Signup/VerifyEmail.dart';
import 'package:flutter_auth/Screens/Welcome/components/SplashScreen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/profile/edit_screen.dart';
import 'package:flutter_auth/components/user.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  static String id = 'Auth_Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData!) {
                return MainScreen();
              } else {
                return WelcomeScreen();
              }
            }));
  }
}
