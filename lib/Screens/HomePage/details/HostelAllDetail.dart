import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class HostelAllDetail extends StatelessWidget {
  final DocumentSnapshot data;
  HostelAllDetail({Key? key, required this.data});

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
              for (var i = 0; i < data['roomType'].length; i++)
                Container(
                  child: Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      i == data['roomType'].length - 1
                          ? data['roomType'][i]
                          : data['roomType'][i] + ',',
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
                data['bathroomType'],
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
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
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
