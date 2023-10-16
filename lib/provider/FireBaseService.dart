import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User user = FirebaseAuth.instance.currentUser!;

class FireBaseService {
  Stream<QuerySnapshot> users = FirebaseFirestore.instance
      .collection('users')
      .where("email", isEqualTo: user.email)
      .snapshots();
  CollectionReference product =
      FirebaseFirestore.instance.collection('property');
  updateFavourite(isLiked, productId, context) {
    if (isLiked) {
      product.doc(productId).update({
        'Favourites': FieldValue.arrayUnion([user.uid])
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Property is Successfully Added to Favourites')));
    } else {
      product.doc(productId).update({
        'Favourites': FieldValue.arrayRemove([user.uid])
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Property is Successfully Removed from Favourites')));
    }
  }
}
