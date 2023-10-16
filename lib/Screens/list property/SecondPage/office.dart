import 'package:chips_choice/chips_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/Screens/list%20property/propertymodel.dart';
import 'package:flutter_auth/constants.dart';

class OfficePage extends StatefulWidget {
  _OfficePage createState() => _OfficePage();
  final String category;
  static String id = 'second';
  final String address;
  final String pincode;
  final String city;
  final String name;
  List<String> images = [];

  OfficePage(
      {Key? key,
      required this.name,
      required this.category,
      required this.city,
      required this.address,
      required this.pincode,
      required this.images})
      : super(key: key);
}

late int noOfBalcony;
List<String> shopOption = [
  'Fire Extinguisher',
  'Fire Sensors',
  'Sprinklers',
  'Emergency exit',
  '24x7 Security',
  'Camera',
  'Table',
  'Chair',
  'Fans',
  'A.C',
];
List<String> officeOption = [
  'Fire Extinguisher',
  'Fire Sensors',
  'Sprinklers',
  'Emergency exit',
  '24x7 Security',
  'Camera',
  'Conference Room',
  'Dining Hall',
  'Table',
  'Fans',
  'A.C',
  'Mini Kitchen',
];
List<String> safetyMeasures = [];

class _OfficePage extends State<OfficePage> {
  final uemail = FirebaseAuth.instance.currentUser!;
  final priceController = TextEditingController();
  final areaController = TextEditingController();
  final otherController = TextEditingController();
  String noOfCabin = '';
  int noOfBathRoom = 1;
  int noOfParking = 1;
  int noOfPreviousOwner = 1;

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
                        label: Text('${index}'),
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
                  if (widget.category == 'Office')
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('No of Cabin :',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: kPrimaryColor)),
                    ),
                  if (widget.category == 'Office')
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                          children: List.generate(10, (int index) {
                        return ChoiceChip(
                          padding: EdgeInsets.all(8),
                          label: Text('${index + 1}'),
                          selectedColor: kPrimaryLightColor,
                          selected: noOfCabin == index,
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
                      value: safetyMeasures,
                      onChanged: (val) => setState(() => safetyMeasures = val),
                      choiceItems: C2Choice.listFrom(
                        source: widget.category == 'Office'
                            ? officeOption
                            : shopOption,
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
                        labelText: "Price",
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
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      cursorColor: kPrimaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: widget.category == 'Office'
                            ? "Office Area"
                            : "Shop Area",
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
                            name: widget.name,
                            category: widget.category,
                            address: "${widget.address}",
                            image: widget.images,
                            noOfBathRoom: noOfBathRoom.toString(),
                            area: areaController.text.trim(),
                            city: widget.city,
                            cabin: noOfCabin,
                            noOfParking: noOfParking.toString(),
                            pincode: int.parse(widget.pincode),
                            price: int.parse(priceController.text.trim()),
                            other: otherController.text.trim(),
                            otherCategory: safetyMeasures,
                            noOfPreviousOwner: noOfPreviousOwner.toString(),
                            email: uemail!.email!,
                            Favourites: []);

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
