import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_auth/Screens/Registration/Registration_page.dart';
import 'package:flutter_auth/Screens/Signup/VerifyEmail.dart';
import 'package:flutter_auth/components/circular_progress.dart';
import 'package:flutter_auth/provider/Auth_Page.dart';
import 'package:provider/provider.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../HomePage/home_screen.dart';
import '../../Login/login_screen.dart';
import '../../Registration/registration_screen.dart';
import '../../../components/circularIndicator.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  static String id = 'signupform_page';
  final emailController = TextEditingController();
  // ignore: non_constant_identifier_names
  final PasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    bool isValidate = false;
    showSnackBar(String message, Duration duration) {
      //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
      final snackBar = SnackBar(content: Text(message), duration: duration);
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar); //Manages SnackBars and MaterialBanners for descendant Scaffolds.This class provides APIs for showing snack bars and material banners at the bottom and top of the screen, respectively.
    }

    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: SingleChildScrollView(
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
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(width: 2, color: kPrimaryColor),
                  ),
                ),
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your email id';
                  }
                },
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
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Enter correct Password';
                    }
                  },
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              ElevatedButton(
                child: Text(
                  "Sign Up".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  CircularIndicator().createCircularProgress(context);
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isValidate = true;
                    });
                  } else {
                    setState(() {
                      isValidate = false;
                    });
                  }
                  (await _auth
                      .createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: PasswordController.text.trim())
                      .then((value) {
                    print("successsfully logged-in");
                  }).then((value) {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(
                        context,
                        VerifyEmailPage
                            .id); //Navigator helps us navigate to new route. Navigator.push() method is used to switch to a new route.
                    showSnackBar('Successfull Sign In', Duration(seconds: 3));
                  }).onError((error, stackTrace) {
                    Navigator.of(context).pop();
                    print("error ${error.toString()}");
                    showSnackBar(
                        "error ${error.toString()}", //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
                        Duration(milliseconds: 2000));
                  }));
                },
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              ),
              const SizedBox(height: defaultPadding),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
