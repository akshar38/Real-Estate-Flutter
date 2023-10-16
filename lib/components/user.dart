import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  final String name;
  final String address;
  final int phoneno;
  final int pincode;
  final String username;
  final String email;
  final String image;

  UserModel(
      {this.id = '',
      required this.name,
      required this.address,
      required this.phoneno,
      required this.pincode,
      required this.username,
      required this.email,
      required this.image});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'phoneno': phoneno,
        'pincode': pincode,
        'username': username,
        'email': email,
        'image': image,
      };
  static UserModel fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: data['id'],
        name: data['name'],
        phoneno: data['phoneno'],
        pincode: data['pincode'],
        username: data['username'],
        email: data['email'],
        address: data['address'],
        image: data['image']);
  }

  var useremail = FirebaseAuth.instance.currentUser?.email;
}
