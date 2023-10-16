import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Favourites/AdDisplay.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import '../../provider/FireBaseService.dart';

class FavouriteScreen extends StatefulWidget {
  static String id = 'fav';
  _FavouriteScreen createState() => _FavouriteScreen();
}

FireBaseService _service = FireBaseService();
final _format = NumberFormat('##,##,##,##0');
String? uemail = FirebaseAuth.instance.currentUser!.email;

class _FavouriteScreen extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MainScreen.id);
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          title: Text('My Ads'),
          backgroundColor: kPrimaryColor,
          // ignore: prefer_const_constructors
          bottom: TabBar(
            indicatorColor: Colors.pink.shade200,
            indicatorWeight: 5,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                child: Text(
                  'Ads',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child:
                    Text('Favourites', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: FutureBuilder<QuerySnapshot>(
                future: _service.product
                    .where("email", isEqualTo: uemail)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('please Check Connnection');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  }

                  return AdScreen(snapshot: snapshot);
                }),
          ),
          Center(
            child: Text('My Favourites'),
          )
        ]),
      ),
    );
  }
}
