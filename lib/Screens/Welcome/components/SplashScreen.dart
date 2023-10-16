import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/provider/Auth_Page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../components/background.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash';
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => AuthPage()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: kPrimaryLightColor,
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/splash.png"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome To Apni Property",
                style: TextStyle(
                    color: kPrimaryColor, fontSize: 22, fontFamily: 'Lobster'),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: LoadingAnimationWidget.inkDrop(
                  color: kPrimaryColor,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
