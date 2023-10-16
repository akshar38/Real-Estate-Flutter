import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../../components/user.dart';
import '../../constants.dart';
import '../HomePage/home_screen.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  File? _image;
  String imageUrl = '';
  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  Future getImage(ImageSource source, context) async {
    XFile? file = await ImagePicker().pickImage(source: source);
    if (file == null) {
      return;
    }
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    final imageTemporary = await saveFilePermanently(file.path as String);
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (error) {}
    setState(() {
      _image = imageTemporary;
      Navigator.of(context).pop();
    });
  }

  final uemail = FirebaseAuth.instance.currentUser!;
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final pincodeController = TextEditingController();
  final emailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    nameController.dispose();
    usernameController.dispose();
    pincodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showSnackBar(String message, Duration duration) {
      //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
      final snackBar = SnackBar(content: Text(message), duration: duration);
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar); //Manages SnackBars and MaterialBanners for descendant Scaffolds.This class provides APIs for showing snack bars and material banners at the bottom and top of the screen, respectively.
    }

    bool isValidate = false;
    // TODO: implement build
    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: _image != null
                          ? Image.file(
                              _image!,
                              width: 250,
                              height: 250,
                              fit: BoxFit.cover,
                            )
                          : const Image(image: NetworkImage('')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet(context)));
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kPrimaryColor,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  initialValue: uemail.email!,
                  
                  enabled: false,
                  autofocus: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.email),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                      hintText: "Your phone no",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.phone),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            const BorderSide(width: 2, color: kPrimaryColor),
                      )),
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty && value.length == 10) {
                      return "Enter correct phone no";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Your full name",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.person_outline_rounded),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 2, color: kPrimaryColor),
                    ),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'^[a-z A-Z]$').hasMatch(value)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "your username",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.person_outline_rounded),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 2, color: kPrimaryColor),
                    ),
                  ),
                  controller: usernameController,
                  validator: (value) {
                    if ((value!.isEmpty ||
                            RegExp(r'^[a-z A-Z]^[0-9]$').hasMatch(value)) &&
                        value.length <= 12) {
                      return "Enter correct username";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Your address",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.home),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 2, color: kPrimaryColor),
                    ),
                  ),
                  controller: addressController,
                  validator: (value) {
                    if (value!.isEmpty && value.length >= 30) {
                      return "Enter correct address";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "your pincode",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.pin_drop_outlined),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 2, color: kPrimaryColor),
                    ),
                  ),
                  controller: pincodeController,
                  validator: (value) {
                    if (value!.isEmpty && value.length == 6) {
                      return "Enter correct pincode";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: Text(
                  "Register".toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isValidate = true;
                    });
                  } else {
                    setState(() {
                      isValidate = false;
                    });
                  }
                  if (isValidate) {
                    if (imageUrl != null) {
                      Navigator.pushNamed(context, MainScreen.id);
                      showSnackBar(
                          'Successfully Registered', Duration(seconds: 3));
                      final user = UserModel(
                        image: imageUrl,
                        email: uemail.email!,
                        name: nameController.text.trim(),
                        phoneno: int.parse(phoneController.text.trim()),
                        address: addressController.text.trim(),
                        username: usernameController.text.trim(),
                        pincode: int.parse(pincodeController.text.trim()),
                      );
                      createUser(user);
                    } else {
                      showSnackBar(
                          "Enter the Profile pic", //Shows a SnackBar across all registered Scaffolds.A scaffold can show at most one snack bar at a time. If this function is called while another snack bar is already visible, the given snack bar will be added to a queue and displayed after the earlier snack bars have closed.
                          const Duration(milliseconds: 2000));
                    }
                  }
                },
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ));
  }

  Future createUser(UserModel user) async {
    final docUser =
        // ignore: unnecessary_string_interpolations
        FirebaseFirestore.instance.collection('users').doc('${uemail.email}');

    // ignore: unused_local_variable
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }

  Widget bottomSheet(context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.camera,color: kPrimaryColor,),
                onPressed: () {
                  getImage(ImageSource.camera, context);
                },
                label: const Text("Camera",style: TextStyle(color: kPrimaryColor)),
              ),
              TextButton.icon(
                  onPressed: () {
                    getImage(ImageSource.gallery, context);
                  },
                  icon: const Icon(Icons.image,color: kPrimaryColor,),
                  label: const Text("Gallery",style: TextStyle(color: kPrimaryColor))),
            ],
          )
        ],
      ),
    );
  }
}
