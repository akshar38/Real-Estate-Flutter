// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class ForgotPasswordPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text('Reset Password', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Receive an email\n to reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    hintText: "email",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.person),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(width: 2, color: kPrimaryColor),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter your email";
                    }
                    return null;
                  },
                  controller: emailController,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    resetPassword(context);
                  },
                  icon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Reset Passsword",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size.fromHeight(50)),
                ),
              ],
            )),
      ),
    );
  }

  Future resetPassword(context) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Password reset link sent'),
    ));
  }
}
