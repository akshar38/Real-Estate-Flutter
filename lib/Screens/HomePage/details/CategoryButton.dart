import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
      padding: const EdgeInsets.all(8.0),
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          //border: Border.all(color: kPrimaryColor),
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network('$image'),
          SizedBox(
            height: 10,
          ),
          Text(
            '$title',
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
