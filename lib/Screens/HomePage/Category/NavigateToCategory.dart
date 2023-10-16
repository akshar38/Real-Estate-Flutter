import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/CustomSearchDelegate.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import '../../../provider/FireBaseService.dart';
import '../../Favourites/AdDisplay.dart';

class NavigateToCategory extends StatelessWidget {
  final String category;
  NavigateToCategory({Key? key, required this.category});
  FireBaseService _service = FireBaseService();
  final _format = NumberFormat('##,##,##,##0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),

        backgroundColor: kPrimaryColor,
        // ignore: prefer_const_constructors
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){
                showSearch(
                    context: context, delegate: CustomSearchDelegate());
            },
          ), //IconButton
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              //Navigator.pushNamed(context, FavouriteScreen.id);
            },
          ), //IconButton
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: _service.product.where('category', isEqualTo: category).get(),
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

            return AdScreen(snapshot: snapshot);
          }),
    );
  }
}
