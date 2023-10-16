import 'dart:ffi';

import 'package:chips_choice/chips_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/Screens/HomePage/home_screen.dart';
import 'package:flutter_auth/Screens/list%20property/Addpropertypage.dart';
import 'package:flutter_auth/Screens/list%20property/SecondPage/DecorOption.dart';
import 'package:flutter_auth/Screens/list%20property/propertymodel.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/provider/ProductProvider.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  _SecondPage createState() => _SecondPage();
  final String name;
  static String id = 'second';
  final String address;
  final String pincode;
  final String category;
  final String city;
  List<String> images = [];

  SecondPage(
      {Key? key,
      required this.name,
      required this.category,
      required this.city,
      required this.address,
      required this.pincode,
      required this.images})
      : super(key: key);
}

List<String> optionDecor = [
  'Sofa',
  'Dinig Table',
  'Refrigerator',
  'A.C',
  'Chimney',
  'Study Table',
  'Bed',
  'Television',
  'Wardrobes',
  'Geysers',
  'Fan',
  'Curtain',
];

class _SecondPage extends State<SecondPage> {
  final uemail = FirebaseAuth.instance.currentUser!;
  final priceController = TextEditingController();
  final areaController = TextEditingController();
  final otherController = TextEditingController();

  int noOfBedRoom = 1;
  int noOfBathRoom = 1;
  int noOfParking = 1;
  int noOfPreviousOwner = 1;
  List<String> selectedSecurity = [];
  List<String> security = [
    'Fire Extinguisher',
    'Fire Sensors',
    'Sprinklers',
    'Gatted',
    'Emergency exit',
    '24x7 Security',
    'Camera',
    'Garden',
    'ClubHouse',
    'Gym',
    'Swimming pool',
    
    'Power Backup'
  ];
  List<String> selectedDecor = [];
  List<String> roomOption = ['Pooja', 'Study Room', 'Servant Room', 'Others'];
  List<String> selectedOption = [];
  List<String> option = ['Furnished', 'UnFurnished'];
  String selectedFurnitureOption = '';
  int tag = 1;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    showSnackBar(String message, Duration duration) {
    //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
    final snackBar = SnackBar(content: Text(message), duration: duration);
    ScaffoldMessenger.of(context).showSnackBar(
        snackBar); //Manages SnackBars and MaterialBanners for descendant Scaffolds.This class provides APIs for showing snack bars and material banners at the bottom and top of the screen, respectively.
  }
    var provider = Provider.of<ProductProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Second Page'),
          backgroundColor: Color(0xFF6F35A5),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'No of BedRooms :',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                        children: List.generate(4, (int index) {
                      return ChoiceChip(
                        padding: EdgeInsets.all(8),
                        label: Text('${index + 1}'),
                        selectedColor: kPrimaryLightColor,
                        selected: noOfBedRoom == index,
                        onSelected: (bool selected) {
                          setState(() {
                            noOfBedRoom = (selected ? index : null)!;
                          });
                        },
                      );
                    })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('No of BathRooms :',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                        children: List.generate(4, (int index) {
                      return ChoiceChip(
                        padding: EdgeInsets.all(8),
                        label: Text('${index + 1}'),
                        selectedColor: kPrimaryLightColor,
                        selected: noOfBathRoom == index,
                        onSelected: (bool selected) {
                          setState(() {
                            noOfBathRoom = (selected ? index : null)!;
                          });
                        },
                      );
                    })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('No of Parkings :',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                        children: List.generate(3, (int index) {
                      return ChoiceChip(
                        padding: EdgeInsets.all(8),
                        label: Text('${index + 1}'),
                        selectedColor: kPrimaryLightColor,
                        selected: noOfParking == index,
                        onSelected: (bool selected) {
                          setState(() {
                            noOfParking = (selected ? index : null)!;
                          });
                        },
                      );
                    })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Count of Previous Owner :',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                        children: List.generate(4, (int index) {
                      return ChoiceChip(
                        padding: EdgeInsets.all(8),
                        label: Text('$index'),
                        selectedColor: kPrimaryLightColor,
                        selected: noOfPreviousOwner == index,
                        onSelected: (bool selected) {
                          setState(() {
                            noOfPreviousOwner = (selected ? index : null)!;
                          });
                        },
                      );
                    })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Security Details',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ChipsChoice<String>.multiple(
                      padding: EdgeInsets.zero,
                      value: selectedSecurity,
                      onChanged: (val) =>
                          setState(() => selectedSecurity = val),
                      choiceItems: C2Choice.listFrom(
                        source: security,
                        value: (i, v) => v,
                        label: (i, v) => v,
                      ),
                      choiceActiveStyle: C2ChoiceStyle(color: kPrimaryColor),
                      wrapped: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Furnishing Details',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ChipsChoice<String>.single(
                      padding: EdgeInsets.zero,
                      value: selectedFurnitureOption,
                      onChanged: (val) =>
                          setState(() => selectedFurnitureOption = val),
                      choiceItems: C2Choice.listFrom(
                        source: option,
                        value: (i, v) => v,
                        label: (i, v) => v,
                      ),
                      choiceActiveStyle: C2ChoiceStyle(color: kPrimaryColor),
                      wrapped: true,
                    ),
                  ),
                  if (selectedFurnitureOption == 'Furnished')
                    SizedBox(
                      height: 20,
                    ),
                  if (selectedFurnitureOption == 'Furnished')
                    DecorOption(optionDecor: optionDecor),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Are there any other rooms?',
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ChipsChoice<String>.multiple(
                      padding: EdgeInsets.zero,
                      value: selectedOption,
                      onChanged: (val) => setState(() => selectedOption = val),
                      choiceItems: C2Choice.listFrom(
                        source: roomOption,
                        value: (i, v) => v,
                        label: (i, v) => v,
                      ),
                      choiceActiveStyle: C2ChoiceStyle(color: kPrimaryColor),
                      wrapped: true,
                    ),
                  ),
                  if (widget.category == 'Rent')
                    const SizedBox(
                      height: 5,
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      cursorColor: kPrimaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: widget.category == 'Rent'
                            ? "Rent of Month"
                            : "Price of Property",
                        prefixIcon: Icon(Icons.currency_rupee),
                        labelStyle: TextStyle(color: kPrimaryColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(width: 2, color: kPrimaryColor),
                        ),
                      ),
                      controller: priceController,
                      validator: (value) {
                        if (value!.isEmpty || int.parse(value) > 100000000) {
                          if (int.parse(value) > 100000000) {
                            return "Enter the price less than 100000000";
                          }
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      cursorColor: kPrimaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "House Area",
                        suffix: const Text('sq.ft'),
                        labelStyle: const TextStyle(color: kPrimaryColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(width: 2, color: kPrimaryColor),
                        ),
                      ),
                      controller: areaController,
                      validator: (value) {
                        if (value!.isEmpty || int.parse(value) > 10000) {
                          if (int.parse(value) > 10000) {
                            return "Enter the sq.ft area less than 10000";
                          } else {
                            return "Enter the sq.ft area of the property";
                          }
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      cursorColor: kPrimaryColor,
                      maxLength: 200,
                      maxLines: 3,
                      controller: otherController,
                      decoration: InputDecoration(
                        labelText: "Other",
                        labelStyle: TextStyle(color: kPrimaryColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(width: 2, color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final user = PropertyModel(
                            security: selectedSecurity,
                            decor: provider.selected,
                            furniture: selectedFurnitureOption,
                            name: widget.name,
                            category: widget.category,
                            address: widget.address,
                            image: widget.images,
                            noOfBathRoom: noOfBathRoom.toString(),
                            area: areaController.text.trim(),
                            noOfBedRoom: noOfBedRoom.toString(),
                            city: widget.city,
                            noOfParking: noOfParking.toString(),
                            pincode: int.parse(widget.pincode),
                            price: int.parse(priceController.text.trim()),
                            other: otherController.text.trim(),
                            otherCategory: selectedOption,
                            noOfPreviousOwner: noOfPreviousOwner.toString(),
                            email: uemail!.email!,
                            Favourites:[]);

                        Navigator.pushNamed(context, MainScreen.id);
                        createUser(user);
                      }else {
                            showSnackBar(
                                "Your Property is successfully added", //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
                                const Duration(milliseconds: 2000));
                          }
                      
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    child: const Text(
                      'Save Property',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future createUser(PropertyModel user) async {
    final docUser =
        // ignore: unnecessary_string_interpolations
        FirebaseFirestore.instance.collection('property').doc();
    print('id:' + docUser.id);
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}
