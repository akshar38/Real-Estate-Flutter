import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class HouseAllDetail extends StatelessWidget {
  final DocumentSnapshot data;
  HouseAllDetail({Key? key, required this.data});

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
                  padding: EdgeInsets.fromLTRB(15, 5, 59, 10),
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
          SizedBox(
            height: 5,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 55, 10),
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
                  padding: EdgeInsets.fromLTRB(15, 5, 68, 10),
                  child: Text('Furniture:',
                      style: TextStyle(color: kPrimaryColor))),
              Text(
                data['furniture'],
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
                  padding: EdgeInsets.fromLTRB(15, 5, 48, 0),
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
