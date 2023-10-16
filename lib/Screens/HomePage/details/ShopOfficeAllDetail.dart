import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ShopOfficeAllDetail extends StatelessWidget {
  final DocumentSnapshot data;
  ShopOfficeAllDetail({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 143, 10),
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
                  padding: EdgeInsets.fromLTRB(15, 5, 185, 10),
                  child:
                      Text('Area :', style: TextStyle(color: kPrimaryColor))),
              Text(
                data['area'],
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
                  padding: EdgeInsets.fromLTRB(15, 5, 122, 10),
                  child: Text('No of Parking :',
                      style: TextStyle(color: kPrimaryColor))),
              Text(
                data['noOfParking'],
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
                  child: Text('No Of Previous Owner:',
                      style: TextStyle(color: kPrimaryColor))),
              Text(
                data['noOfOwner'],
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
