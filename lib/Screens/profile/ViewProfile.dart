import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/profile/edit_screen.dart';
import 'package:flutter_auth/Screens/profile/profile_page.dart';
import 'package:flutter_auth/provider/FireBaseService.dart';

import '../../components/user.dart';
import '../../constants.dart';
import '../../provider/auth.dart';

String? uemail = FirebaseAuth.instance.currentUser!.email;

class ViewProfile extends StatelessWidget {
  static String id = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ProfileScreen.id);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder<UserModel>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel users = snapshot.data as UserModel;
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            '${users.image}',
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        enabled: false,
                        initialValue: users.email,
                        autofocus: false,
                        decoration: InputDecoration(
                            hintText: "email :",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.email),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  width: 2, color: kPrimaryColor),
                            )),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        enabled: false,
                        initialValue: users.name,
                        decoration: InputDecoration(
                            hintText: "name :",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.person),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  width: 2, color: kPrimaryColor),
                            )),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        initialValue: users.address,
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: "address :",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.home),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  width: 2, color: kPrimaryColor),
                            )),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        initialValue: users.phoneno.toString(),
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: "phone no :",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.phone),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  width: 2, color: kPrimaryColor),
                            )),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        cursorColor: kPrimaryColor,
                        initialValue: users.pincode.toString(),
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: "pincode :",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.pin_drop_outlined),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  width: 2, color: kPrimaryColor),
                            )),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(uemail.toString()),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
        future: getData(),
      ),
    );
  }
}
