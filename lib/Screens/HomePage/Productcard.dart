import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Favourites/AdDisplay.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/provider/FireBaseService.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

class PropertyList extends StatefulWidget {
  _PropertyList createState() => _PropertyList();
}

FireBaseService _service = FireBaseService();
final _format = NumberFormat('##,##,##,##0');

class _PropertyList extends State<PropertyList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<QuerySnapshot>(
          future: _service.product.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('please Check Connnection');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                  padding: const EdgeInsets.only(left: 140, right: 140),
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColorDark),
                    backgroundColor: kPrimaryBackGroundColor,
                  ));
            }

            return AdScreen(snapshot: snapshot);
          }),
    );
  }
}
