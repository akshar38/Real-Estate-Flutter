import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularIndicator {
  createCircularProgress(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
