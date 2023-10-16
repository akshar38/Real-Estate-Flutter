import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Registration/Registration_page.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/responsive.dart';
import '../../components/background.dart';
import '../Signup/components/socal_sign_up.dart';

class RegistrationScreen extends StatelessWidget {
  static String id = 'register_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Registration Page',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: 120,
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   right: 0,
              //   child: Image.asset(bottomImage, width: 120),
              // ),
              SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: const [
                        Spacer(),
                        Expanded(
                          flex: 8,
                          child: RegistrationForm(),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
