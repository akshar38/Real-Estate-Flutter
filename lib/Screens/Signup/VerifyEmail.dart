import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_auth/Screens/Registration/registration_screen.dart';
import 'package:flutter_auth/constants.dart';

import '../HomePage/MainScreen.dart';
import '../HomePage/home_screen.dart';

class VerifyEmailPage extends StatefulWidget {
  static String id = 'verify';

  const VerifyEmailPage({Key? key}) : super(key: key);
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isVerified = false;
  bool canResendEmail = false;

  late final timer;

  @override
  void initState() {
    super.initState();

    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isVerified) {
      sendVerificationEmail();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
      // ignore: empty_catches
    } catch (e) {}
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => checkEmailVerfied(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isVerified
      ? RegistrationScreen()
      : Scaffold(
          appBar: AppBar(
            title: const Text(
              'Verify Email',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: kPrimaryColor,
          ),
          body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'A Verification email has been sent to your email address',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      //canResendEmail ? sendVerificationEmail() : null;
                    },
                    icon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Resent Email',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                  ),
                  TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text(
                        'cancel',
                        style: TextStyle(color: kPrimaryColor),
                      ))
                ],
              )),
        );

  Future checkEmailVerfied() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerified) timer?.cancel();
  }
}
