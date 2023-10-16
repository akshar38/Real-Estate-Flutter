import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/Screens/profile/edit_screen.dart';

import 'package:flutter_auth/components/user.dart';

import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/provider/Auth_Page.dart';
import 'package:flutter_auth/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../../provider/auth.dart';
import '../Login/login_screen.dart';
import 'ViewProfile.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_page';

  const ProfileScreen({Key? key}) : super(key: key);
  _ProfileScreen createState() => _ProfileScreen();
}

var uemail = FirebaseAuth.instance.currentUser!.email;
DocumentSnapshot snapshot = FirebaseFirestore.instance
    .collection("users")
    .doc(uemail)
    .get() as DocumentSnapshot<Object?>;

class _ProfileScreen extends State<ProfileScreen> {
  String image = '';
  final user = FirebaseAuth.instance.currentUser!;
  Future getData() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uemail).get();
    setState(() {
      image = snapshot.get('image');
    });
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, MainScreen.id);
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF6F35A5),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData!) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                '${image}',
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kPrimaryColor,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(user.email!),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, EditScreen.id);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: Text('Edit Profile',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ViewProfile.id);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: Text('Your Profile',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),
                    ProfileMenuWidget(
                      title: "Settings",
                      icon: Icons.settings,
                      onPress: () {},
                      endIcon: true,
                    ),
                    const SizedBox(height: 20),
                    ProfileMenuWidget(
                      title: "User Management",
                      icon: Icons.person,
                      onPress: () {},
                      endIcon: true,
                    ),
                    const SizedBox(height: 20),
                    ProfileMenuWidget(
                      title: "Information",
                      icon: Icons.info,
                      onPress: () {},
                      endIcon: true,
                    ),
                    const SizedBox(height: 20),
                    ProfileMenuWidget(
                      title: "Logout",
                      icon: Icons.logout,
                      onPress: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      endIcon: false,
                    ),
                  ]),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endIcon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: kPrimaryLightColor,
        ),
        child: Icon(icon, color: kPrimaryColor),
      ),
      title: Text(title),
      trailing: endIcon
          ? Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kPrimaryLightColor,
              ),
              child: const Icon(
                Icons.arrow_right,
                size: 25.0,
                color: kPrimaryColor,
              ),
            )
          : null,
    );
  }
}
