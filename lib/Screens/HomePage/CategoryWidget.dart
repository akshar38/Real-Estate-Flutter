import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/Category/NavigateToCategory.dart';

import '../../constants.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(252, 236, 255, 1),
      height: 100,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryButton(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-villa-50.png?alt=media&token=492e4dfe-be3f-449d-b431-f25ac5200f0b",
              title: "house",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigateToCategory(
                          category: 'House',
                        )));
              }),
          CategoryButton(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-city-buildings-50.png?alt=media&token=96b6e935-1c30-42f3-a9d9-23173c4ac581",
              title: "Flat",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigateToCategory(
                          category: 'Flat',
                        )));
              }),
          CategoryButton(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-hotel-50.png?alt=media&token=775c87c8-e719-490c-9225-2f804d22bb1f",
              title: "Hostel",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigateToCategory(
                          category: 'Hostel',
                        )));
              }),
          CategoryButton(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-hostel-50.png?alt=media&token=89b44373-1401-40d3-b3f6-68a48791708d",
              title: "PGs",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigateToCategory(
                          category: 'PG',
                        )));
              }),
          CategoryButton(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-field-50.png?alt=media&token=1c3aecd2-10ae-4049-80f1-036b772a52be",
              title: "Land",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigateToCategory(
                          category: 'Land',
                        )));
              }),
          CategoryButton(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-villa-50.png?alt=media&token=492e4dfe-be3f-449d-b431-f25ac5200f0b",
              title: "Rent",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigateToCategory(
                          category: 'Rent',
                        )));
              }),
          CategoryButton(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-shop-50.png?alt=media&token=5c928aa4-a1e9-4039-a2a9-5c48ee39e9b6",
              title: "Shop",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigateToCategory(
                          category: 'Shop',
                        )));
              }),
          CategoryButton(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-office-50.png?alt=media&token=95a4d653-9a51-468e-af74-0355c0dd4299",
              title: "Office",
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigateToCategory(
                          category: 'Office',
                        )));
              }),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.image,
    required this.title,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final String image;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
      padding: EdgeInsets.all(8.0),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          //border: Border.all(color: kPrimaryColor),
          ),
      child: InkWell(
        onTap: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image == null
                ? Icon(CupertinoIcons.photo_on_rectangle)
                : Image.network('$image'),
            Text(
              '$title',
              style: TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
