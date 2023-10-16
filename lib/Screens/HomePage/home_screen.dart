import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Screens/Favourites/FavouriteScreen.dart';
import 'package:flutter_auth/Screens/HomePage/BannerWidget.dart';
import 'package:flutter_auth/Screens/location/loacation-screen.dart';
import 'package:flutter_auth/Screens/message/ChatScreen.dart';
import 'package:flutter_auth/Screens/profile/profile_page.dart';
import 'package:flutter_auth/components/user.dart';
import 'package:flutter_auth/Screens/list%20property/Addpropertypage.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/provider/ProductProvider.dart';

import 'package:flutter_auth/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:sliver_app_bar_title/sliver_app_bar_title.dart';

import '../Login/login_screen.dart';
import '../Registration/registration_screen.dart';
import '../Signup/components/or_divider.dart';
import 'CategoryWidget.dart';
import 'CustomSearchDelegate.dart';
import 'Productcard.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_page';
  _HomeScreen createState() => _HomeScreen();
  HomeScreen({Key? key}) : super(key: key);
}

class _HomeScreen extends State<HomeScreen> {
  final globalKey = GlobalKey();
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _tabItems = [
    HomeScreen(),
    AddNewPropertyPage(),
    ChatScreen()
  ];
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onBackButtonPressed(context),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: const Text("Home"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
              ), //IconButton
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, FavouriteScreen.id);
                },
              ), //IconButton
            ],
          ),
          drawer: NavigationDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(children: [
                      BannerWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Category',
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 17)),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'See All >',
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CategoryWidget(),
                      const Divider(
                        color: kPrimaryColor,
                        height: 5,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Freshly Recommended',
                        style: TextStyle(color: kPrimaryColor, fontSize: 17)),
                  ),
                  PropertyList(),
                ],
              ),
            ),
          ),
        ));
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Really??"),
            content: const Text("do you want to exit?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text("Yes")),
            ],
          );
        });
    return exitApp;
  }
}

final uemail = FirebaseAuth.instance.currentUser!.email;

class NavigationDrawer extends StatefulWidget {
  _NavigationDrawer createState() => _NavigationDrawer();
}

class _NavigationDrawer extends State<NavigationDrawer> {
  final user = FirebaseAuth.instance.currentUser!;
  String image = '';
  Future getData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uemail).get();

    setState(() {
      
      image = snapshot.get('image');
    });
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData!) {
              return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProfileScreen.id);
                      },
                      child: Column(children: [
                        
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('${image}'),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          user.email!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: kPrimaryColor,
                    ),
                    title: const Text('Home',
                        style: TextStyle(color: kPrimaryColor)),
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                  ),
                  const Divider(color: Colors.black),
                  ListTile(
                    leading: const Icon(
                      Icons.account_circle,
                      color: kPrimaryColor,
                    ),
                    title: const Text('ListedProperty',
                        style: TextStyle(color: kPrimaryColor)),
                    onTap: () async {
                      Navigator.pushNamed(context, LocationScreen.id);
                    },
                  ),
                  const Divider(color: kPrimaryColor),
                  const ListTile(
                    leading: Icon(
                      Icons.message,
                      color: kPrimaryColor,
                    ),
                    title: Text('Messages',
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  const Divider(color: Colors.black),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: kPrimaryColor,
                    ),
                    title: const Text('Logout',
                        style: TextStyle(color: kPrimaryColor)),
                    onTap: () {
                      GoogleSignInProvider().logout();
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          future: getData()),
    );
  }
}

