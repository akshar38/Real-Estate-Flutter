import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';

import 'package:flutter_auth/Screens/HomePage/home_screen.dart';
import 'package:flutter_auth/Screens/Login/ForgotPassword.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/components/circular_progress.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/circularIndicator.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  var user = null;
  @override
  Widget build(BuildContext context) {
    showSnackBar(String message, Duration duration) {
      //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
      final snackBar = SnackBar(content: Text(message), duration: duration);
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar); //Manages SnackBars and MaterialBanners for descendant Scaffolds.This class provides APIs for showing snack bars and material banners at the bottom and top of the screen, respectively.
    }

    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Icon(Icons.person),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
              ),
            ),
            controller: emailController,
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
              controller: PasswordController,
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(190, 0, 0, 0),
              child: Text(
                "Forgot password?",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor,
                    fontSize: 12),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ForgotPasswordPage(),
              ));
            },
          ),
          SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                CircularIndicator().createCircularProgress(context);
                (FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        //Tries to create a new user account with the given email address and password. If successful, it also signs the user in into the app.
                        email: emailController.text,
                        password: PasswordController.text)
                    .then((value) {
                  print("successsfully logged-in");
                }).then((value) {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(
                      context,
                      MainScreen
                          .id); //Navigator helps us navigate to new route. Navigator.push() method is used to switch to a new route.
                  showSnackBar('Successfull Logged In', Duration(seconds: 3));
                }).onError((error, stackTrace) {
                  Navigator.of(context).pop();
                  print("error ${error.toString()}");
                  showSnackBar(
                      "error ${error.toString()}", //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
                      Duration(milliseconds: 2000));
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                side: BorderSide.none,
                shape: const StadiumBorder(),
              ),
              child: Text(
                "Login".toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.pushNamed(context, SignUpScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
