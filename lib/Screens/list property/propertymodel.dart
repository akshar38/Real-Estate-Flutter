import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PropertyModel {
  List<String>? security;
  String bathroomType;
  String noOfStudent;
  String type;
  final String address;
  final String city;
  final int pincode;
  List<String>? otherCategory;
  String noOfBedRoom;
  String noOfBathRoom;
  String noOfParking;
  String other;
  final String category;
  final int price;
  String area;
  final List<String> image;
  String noOfPreviousOwner;
  String noOfOpenSide;
  final String email;
  String id;
  String construction;
  String side;
  String length;
  String breadth;
  String cabin;
  List<String>? roomType;
  final String name;
  List<String>? decor;
  String furniture;
  List<String>? Favourites;
  PropertyModel({
    this.noOfOpenSide = '',
    required this.name,
    this.decor,
    this.type = '',
    this.other = '',
    required this.category,
    this.id = '',
    this.construction = '',
    this.side = '',
    this.length = '',
    this.breadth = '',
    this.otherCategory,
    this.noOfBedRoom = '',
    this.noOfBathRoom = '',
    this.noOfParking = '',
    this.furniture = '',
    required this.price,
    this.area = '',
    required this.address,
    required this.city,
    required this.pincode,
    required this.image,
    this.noOfPreviousOwner = '',
    required this.email,
    this.roomType,
    this.noOfStudent = '',
    this.cabin = '',
    this.bathroomType = '',
    this.security,
    this.Favourites,
  });

  Map<String, dynamic> toJson() => {
        'noOfOpenSide': noOfOpenSide,
        'security': security,
        'type': type,
        'furniture': furniture,
        'decor': decor,
        'Propertyname': name,
        'Propertyaddress': address,
        'city': city,
        'pincode': pincode,
        'Propertyimage': image,
        'noOfBedRoom': noOfBedRoom,
        'noOfBathRoom': noOfBathRoom,
        'noOfParking': noOfParking,
        'other': other,
        'Propertyprice': price,
        'area': area,
        'OtherCategory': otherCategory,
        'noOfOwner': noOfPreviousOwner,
        'email': email,
        'id': id,
        'category': category,
        'length': length,
        'breadth': breadth,
        'side': side,
        'construction': construction,
        'cabin': cabin,
        'roomType': roomType,
        'noOfStudent': noOfStudent,
        'bathroomType': bathroomType,
        'Favourites':Favourites
      };
  // static PropertyModel fromJson(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   final data = document.data()!;
  //   return PropertyModel(
  //     furniture: data['furniture'],
  //       decor: data['decor'],
  //       name: data['Propertyname'],
  //       category: data['category'],
  //       city: data['city'],
  //       pincode: data['pincode'],
  //       address: data['Propertyaddress'],
  //       image: data['Propertyimage'],
  //       noOfBedRoom: data['noOfBedRoom'],
  //       noOfBathRoom: data['noOfBathRoom'],
  //       noOfParking: data['noOfParking'],
  //       price: data['Propertyprice'],
  //       area: data['area'],
  //       otherCategory: data['OtherCategory'],
  //       other: data['other'],
  //       noOfPreviousOwner: data['noOfOwner'],
  //       email: data['email'],
  //       length: data['length'],
  //       breadth: data['breadth'],
  //       side: data['side'],
  //       construction: data['construction'],
  //       id: data['id'],
  //       cabin: data['cabin'],
  //       roomType: data['roomType']);
  // }

  var useremail = FirebaseAuth.instance.currentUser?.email;
}
