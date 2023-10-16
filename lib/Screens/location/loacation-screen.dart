import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/location/location_image.dart';
import 'package:flutter_auth/constants.dart';

import '../../components/background.dart';

class LocationScreen extends StatefulWidget {
  static String id = 'location';
  _LocationScreen createState() => _LocationScreen();
}

class _LocationScreen extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LocationImage(),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Around Me',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Set Location manually',
                style: TextStyle(color: kPrimaryColor),
              ))
        ],
      )),
    );
  }
}
