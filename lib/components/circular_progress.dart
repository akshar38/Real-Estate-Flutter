import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircluarProgress {
  buffercall(context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
  }

  endcall(context) async {
    Navigator.of(context).pop();
  }
}
