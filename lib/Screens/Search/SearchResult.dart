import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/constants.dart';

import '../../provider/FireBaseService.dart';
import '../Favourites/AdDisplay.dart';
import '../Favourites/FavouriteScreen.dart';
import '../HomePage/CustomSearchDelegate.dart';

class SearchResult extends StatelessWidget {
  FireBaseService _service = FireBaseService();

  final String city;
  SearchResult({Key? key, required this.city}) : super(key: key);
  static String id = 'search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(city),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
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
      body: FutureBuilder<QuerySnapshot>(
          future: _service.product
              .where('city', isEqualTo: city.toLowerCase())
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            if (snapshot.hasData == false) {
              return Center(
                  child: Text(
                'No Property Found',
                style: TextStyle(color: kPrimaryColor, fontSize: 16),
              ));
            }
            return AdScreen(snapshot: snapshot);
          }),
    );
  }
}
