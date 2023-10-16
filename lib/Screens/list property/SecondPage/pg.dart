import 'package:chips_choice/chips_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/Screens/list%20property/propertymodel.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

import 'SelectionofOption/SingleChoice.dart';
import 'office.dart';

class PGPage extends StatefulWidget {
  _PGPage createState() => _PGPage();
  static String id = 'second';
  final String name;
  final String address;
  final String pincode;
  final String category;
  final String city;
  List<String> images = [];

  PGPage(
      {Key? key,
      required this.name,
      required this.category,
      required this.city,
      required this.address,
      required this.pincode,
      required this.images})
      : super(key: key);
}

class _PGPage extends State<PGPage> {
  final uemail = FirebaseAuth.instance.currentUser!;
  final priceController = TextEditingController();
  final areaController = TextEditingController();
  final otherController = TextEditingController();
  int noOfBedRoom = 1;
  int noOfCabin = 1;
  int noOfBathRoom = 1;
  int noOfParking = 1;
  int noOfStudent = 1;
  List<String> selectedOption = [];
  List<String> room = [];
  List<String> option = [
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
  List<String> roomOption = ['Normal', 'Deluxe', 'Super Deluxe'];
  List<String> genderOption = ['Boys', 'Girls'];
  List<String> bathRoomOption = ['Common', 'Private'];
  String bathRoomType = '';
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
                        widget.category == 'PG'
                            ? 'Only PG for ?'
                            : 'Only Hostel for',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChoice(
                        option: genderOption,
                      )),
                  if (widget.category == 'PG')
                    SizedBox(
                      height: 20,
                    ),
                  if (widget.category == 'PG')
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('No of BedRoom :',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: kPrimaryColor)),
                    ),
                  if (widget.category == 'PG')
                    SizedBox(
                      height: 10,
                    ),
                  if (widget.category == 'PG')
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
                              noOfBedRoom = (selected ? index : null)!;
                            });
                          },
                        );
                      })),
                    ),
                  if (widget.category == 'PG')
                    SizedBox(
                      height: 20,
                    ),
                  if (widget.category == 'PG')
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('No of Parkings :',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: kPrimaryColor)),
                    ),
                  if (widget.category == 'PG')
                    SizedBox(
                      height: 10,
                    ),
                  if (widget.category == 'PG')
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
                  if (widget.category == 'PG')
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('No of BathRooms :',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: kPrimaryColor)),
                    ),
                  if (widget.category == 'PG')
                    SizedBox(
                      height: 5,
                    ),
                  if (widget.category == 'PG')
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
                  if (widget.category == 'Hostel')
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Bathroom Type :',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: kPrimaryColor)),
                    ),
                  if (widget.category == 'Hostel')
                    SizedBox(
                      height: 5,
                    ),
                  if (widget.category == 'Hostel')
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ChipsChoice<String>.single(
                        padding: EdgeInsets.zero,
                        value: bathRoomType,
                        onChanged: (val) => setState(() => bathRoomType = val),
                        choiceItems: C2Choice.listFrom(
                          source: bathRoomOption,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        choiceActiveStyle: C2ChoiceStyle(color: kPrimaryColor),
                        wrapped: true,
                      ),
                    ),
                  if (widget.category == "PG")
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'No of Students :',
                            style: TextStyle(color: kPrimaryColor),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                              children: List.generate(5, (int index) {
                            return ChoiceChip(
                              padding: EdgeInsets.all(8),
                              label: Text('${index + 2}'),
                              selectedColor: kPrimaryLightColor,
                              selected: noOfStudent == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  noOfStudent = (selected ? index : null)!;
                                });
                              },
                            );
                          })),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Types of rooms',
                        style: TextStyle(color: kPrimaryColor)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ChipsChoice<String>.multiple(
                      padding: EdgeInsets.zero,
                      value: room,
                      onChanged: (val) => setState(() => room = val),
                      choiceItems: C2Choice.listFrom(
                        source: roomOption,
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
                    child: Text('Additional Facility',
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
                        source: option,
                        value: (i, v) => v,
                        label: (i, v) => v,
                      ),
                      choiceActiveStyle: C2ChoiceStyle(color: kPrimaryColor),
                      wrapped: true,
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
                        labelText: widget.category == 'PG'
                            ? "Rent per month"
                            : "Fees Per Annum",
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
                        if (value!.isEmpty || int.parse(value) > 300000) {
                          if (int.parse(value) > 300000) {
                            return "Enter the price less than 300000";
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
                            type: provider.selectedOption,
                            name: widget.name,
                            category: "${widget.category}",
                            address: "${widget.address}",
                            image: widget.images,
                            noOfBathRoom: noOfBathRoom.toString(),
                            city: widget.city,
                            noOfParking: noOfParking.toString(),
                            pincode: int.parse(widget.pincode),
                            price: int.parse(priceController.text.trim()),
                            other: otherController.text.trim(),
                            otherCategory: selectedOption,
                            noOfStudent: noOfStudent.toString(),
                            email: uemail!.email!,
                            roomType: room,
                            bathroomType: bathRoomType,
                            noOfBedRoom: noOfBedRoom.toString(),
                            Favourites:[]);

                        Navigator.pushNamed(context, MainScreen.id);
                        createUser(user);
                      } else {
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
