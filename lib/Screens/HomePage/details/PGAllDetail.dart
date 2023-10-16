import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class PGAllDetail extends StatelessWidget {
  final DocumentSnapshot data;
  PGAllDetail({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 61, 10),
                  child: Text(
                    'BedRoom :',
                    style: TextStyle(color: kPrimaryColor),
                  )),
              Text(
                data['noOfBedRoom'],
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 34, 10),
                  child: Text(
                    'No of Student :',
                    style: TextStyle(color: kPrimaryColor),
                  )),
              Text(
                data['noOfStudent'],
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 58, 10),
                  child: Text('BathRoom :',
                      style: TextStyle(color: kPrimaryColor))),
              Text(
                data['noOfBathRoom'],
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 65, 10),
                  child: Text('Hostel for:',
                      style: TextStyle(color: kPrimaryColor))),
              Text(
                data['type'],
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 57, 0),
                  child:
                      Text('Address:', style: TextStyle(color: kPrimaryColor))),
              Container(
                child: Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    data['Propertyaddress'],
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
