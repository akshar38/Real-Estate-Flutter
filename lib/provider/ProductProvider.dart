import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  late QueryDocumentSnapshot productdata;
  List<String> selected = [];
  String selectedOption = '';
  String profile = '';
  String name = '';
  String mobileno = '';
  getProductDetails(details) {
    productdata = details;
    notifyListeners();
  }

  getDecor(List<String> details) {
    selected = details;
    notifyListeners();
  }

  getSelectedOption(String selected) {
    selectedOption = selected;
    notifyListeners();
  }

  getProfile(String profile) {
    this.profile = profile;
    notifyListeners();
  }

  getName(String name) {
    this.name = name;
    notifyListeners();
  }

  getMobileNo(String no) {
    this.mobileno = no;
    notifyListeners();
  }
}
