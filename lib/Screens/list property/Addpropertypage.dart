import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/Screens/Registration/Registration_page.dart';
//import 'package:flutter_auth/Screens/list%20property/SecondPage/pg.dart';
import 'package:flutter_auth/Screens/list%20property/SecondPage/land.dart';
import 'package:flutter_auth/Screens/list%20property/SecondPage/office.dart';
import 'package:flutter_auth/provider/ProductProvider.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'SecondPage/SelectionofOption/SingleChoice.dart';

import 'SecondPage/house.dart';
import 'SecondPage/pg.dart';

class AddNewPropertyPage extends StatefulWidget {
  static String id = 'new property';

  _AddNewPropertyPage createState() => _AddNewPropertyPage();
}

final uemail = FirebaseAuth.instance.currentUser!.email;

class _AddNewPropertyPage extends State<AddNewPropertyPage> {
  void initState() {
    super.initState();
  }

  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();
  final nameController = TextEditingController();
  File? image;
  List<String> images = [];
  bool _uploading = false;

  Future getImage(ImageSource source, BuildContext context) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
    //final imageTemporary =

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        Navigator.of(context).pop();
      } else {
        print('no image selected');
      }
    });
  }

  Future<String> uploadFile() async {
    File file = File(image!.path);
    String imageName = '${uemail}/${DateTime.now().microsecondsSinceEpoch}';
    String downloadUrl = '';

    try {
      await FirebaseStorage.instance.ref(imageName).putFile(file);
      downloadUrl =
          await FirebaseStorage.instance.ref(imageName).getDownloadURL();
      if (downloadUrl != null) {
        setState(() {
          image = null;
          images.add(downloadUrl);
        });

        //print(_image.length);
      }
      // ignore: empty_catches
    } on FirebaseException catch (e) {
      print(e);
    }
    return downloadUrl;
  }

  List<String> option = [
    'Office',
    'Flat',
    'House',
    'Hostel',
    'PG',
    'Land',
    'Shop',
    'Rent'
  ];
  String selectedPropertyType = '';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    final formKey = GlobalKey<FormState>();
    //final _catprovider = Provider.of<CategoryCLass>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MainScreen.id);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Add property'),
        backgroundColor: Color(0xFF6F35A5),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select the type of your property',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChoice(
                        option: option,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        cursorColor: kPrimaryColor,

                        //initialValue: users.phoneno.toString(),
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name of Property",
                          labelStyle: TextStyle(color: kPrimaryColor),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                width: 2, color: kPrimaryColor),
                          ),
                        ),
                        //controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter name of property";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Stack(
                      children: [
                        if (image != null)
                          Positioned(
                              right: 0,
                              child: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    image = null;
                                  });
                                },
                              )),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: image == null
                                ? FittedBox(
                                    child: Icon(
                                      CupertinoIcons.photo_on_rectangle,
                                      color: Colors.grey,
                                    ),
                                  )
                                : Image.file(
                                    image!,
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (images.length > 2)
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: GalleryImage(
                          numOfShowImages: 3,
                          imageUrls: images,
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (image != null)
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: NeumorphicButton(
                              style: NeumorphicStyle(color: kPrimaryLightColor),
                              child: Text('Save',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                              onPressed: () {
                                setState(() {
                                  _uploading = true;
                                  uploadFile().then((url) {
                                    //Navigator.of(context).pop();
                                    print('visited');
                                    setState(() {
                                      image = null;
                                      _uploading = false;
                                    });
                                  });
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: NeumorphicButton(
                            child: Text(
                              'Cancel',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                            style: NeumorphicStyle(color: kPrimaryLightColor),
                            onPressed: () {
                              image = null;
                            },
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          child: Text(
                            'Upload Images',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet(context)));
                          },
                        ))
                      ],
                    ),
                    if (_uploading == true)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    cursorColor: kPrimaryColor,
                    maxLength: 100,
                    maxLines: 3,
                    //initialValue: users.phoneno.toString(),
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: "Address",
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            const BorderSide(width: 2, color: kPrimaryColor),
                      ),
                    ),
                    //controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter address of property";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    cursorColor: kPrimaryColor,
                    //initialValue: users.phoneno.toString(),
                    controller: cityController,
                    decoration: InputDecoration(
                      labelText: "city",
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            const BorderSide(width: 2, color: kPrimaryColor),
                      ),
                    ),
                    //controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the city of property ";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    cursorColor: kPrimaryColor,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    controller: pincodeController,
                    decoration: InputDecoration(
                      labelText: "Pincode",
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            const BorderSide(width: 2, color: kPrimaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the pincode of area";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                ElevatedButton(
                    child: Text(
                      'Next Page',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (images.isEmpty!) {
                          showSnackBar(
                              "Enter the images of Property", //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
                              const Duration(milliseconds: 2000));
                        } else {
                          if (provider.selectedOption == "Office" ||
                              provider.selectedOption == "Shop") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OfficePage(
                                    name: nameController.text.trim(),
                                    category: provider.selectedOption,
                                    city: cityController.text.trim(),
                                    address: addressController.text.trim(),
                                    pincode: pincodeController.text.trim(),
                                    images: images)));
                          } else if (provider.selectedOption == "PG" ||
                              provider.selectedOption == "Hostel") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PGPage(
                                    name: nameController.text.trim(),
                                    category: provider.selectedOption,
                                    city: cityController.text.trim(),
                                    address: addressController.text.trim(),
                                    pincode: pincodeController.text.trim(),
                                    images: images)));
                          } else if (provider.selectedOption == "Flat" ||
                              provider.selectedOption == "House" ||
                              provider.selectedOption == "Rent") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SecondPage(
                                    name: nameController.text.trim(),
                                    category: provider.selectedOption,
                                    city: cityController.text.trim(),
                                    address: addressController.text.trim(),
                                    pincode: pincodeController.text.trim(),
                                    images: images)));
                          } else if (provider.selectedOption == "Land") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LandPage(
                                    name: nameController.text.trim(),
                                    category: provider.selectedOption,
                                    city: cityController.text.trim(),
                                    address: addressController.text.trim(),
                                    pincode: pincodeController.text.trim(),
                                    images: images)));
                          } else {
                            showSnackBar(
                                "Enter the type of property", //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
                                const Duration(milliseconds: 2000));
                          }
                        }
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            "Choose Image To Upload",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(
                  Icons.camera,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  getImage(ImageSource.camera, context);
                },
                label: const Text("Camera",
                    style: TextStyle(color: kPrimaryColor)),
              ),
              TextButton.icon(
                  onPressed: () {
                    getImage(ImageSource.gallery, context);
                  },
                  icon: const Icon(
                    Icons.image,
                    color: kPrimaryColor,
                  ),
                  label: const Text("Gallery",
                      style: TextStyle(color: kPrimaryColor))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          if (_uploading)
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            )
        ],
      ),
    );
  }

  showSnackBar(String message, Duration duration) {
    //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
    final snackBar = SnackBar(content: Text(message), duration: duration);
    ScaffoldMessenger.of(context).showSnackBar(
        snackBar); //Manages SnackBars and MaterialBanners for descendant Scaffolds.This class provides APIs for showing snack bars and material banners at the bottom and top of the screen, respectively.
  }
}
