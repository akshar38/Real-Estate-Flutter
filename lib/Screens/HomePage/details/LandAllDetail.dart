import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LandAllDetail extends StatelessWidget {
  final DocumentSnapshot data;
  LandAllDetail({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 83, 10),
                  child: Text(
                    'side :',
                    style: TextStyle(color: kPrimaryColor),
                  )),
              Text(
                data['side'],
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
                  child: Text('Breadth :',
                      style: TextStyle(color: kPrimaryColor))),
              Text(
                data['breadth'] + ' sq.ft',
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
                  child:
                      Text('Length :', style: TextStyle(color: kPrimaryColor))),
              Text(
                data['length'] + ' sq.ft',
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
                  padding: EdgeInsets.fromLTRB(15, 5, 80, 10),
                  child:
                      Text('Area :', style: TextStyle(color: kPrimaryColor))),
              Text(
                data['area'] + ' sq.ft',
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
                  padding: EdgeInsets.fromLTRB(15, 5, 68, 10),
                  child: Text('No of Open side :',
                      style: TextStyle(color: kPrimaryColor))),
              Text(
                data['noOfOpenSide'],
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
                  padding: EdgeInsets.fromLTRB(15, 5, 68, 10),
                  child: Text('Construction',
                      style: TextStyle(color: kPrimaryColor))),
              Text(
                data['construction'],
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
                  padding: EdgeInsets.fromLTRB(15, 5, 35, 0),
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
