import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home_screen.dart';
import 'package:flutter_auth/components/circular_progress.dart';

import '../Screens/HomePage/MainScreen.dart';
import '../Screens/Registration/registration_screen.dart';
import '../Screens/profile/edit_screen.dart';

final uemail = FirebaseAuth.instance.currentUser!.email;

class RegisterUserCheck extends StatefulWidget {
  static String id = 'AuthPage2';
  @override
  State<RegisterUserCheck> createState() => _RegisterUserCheck();
}

class _RegisterUserCheck extends State<RegisterUserCheck> {
  bool isTrue = false;
  getDocid() async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await FirebaseFirestore.instance.collection("users").doc(uemail).get();
    //await Future.delayed(const Duration(seconds: 2));
    setState(() {
      if (document.exists) {
        isTrue = true;
      } else {
        isTrue = false;
      }
    });
  }

  @override
  void initState() {
    getDocid();
  }

  @override
  Widget build(BuildContext context) =>
      isTrue ? MainScreen() : RegistrationScreen();
}
