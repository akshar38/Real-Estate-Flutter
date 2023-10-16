import 'dart:io';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_auth/Screens/Registration/registration_screen.dart';
import 'package:flutter_auth/components/circularIndicator.dart';
import 'package:flutter_auth/components/circular_progress.dart';
// ignore: unused_import
import 'package:flutter_auth/components/user.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unnecessary_import

import '../../components/user.dart';
import '../../constants.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  static String id = 'editpage';

  const EditScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _EditScreenPage createState() => _EditScreenPage();
}

var uemail = FirebaseAuth.instance.currentUser!.email;
Future<UserModel> getData() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where("email", isEqualTo: uemail)
      .get();
  final userData = snapshot.docs.map((e) => UserModel.fromJson(e)).single;

  return userData;
}

class _EditScreenPage extends State<EditScreen> {
  bool isLoading = true;
  // ignore: non_constant_identifier_names

  String imageUrl = '';
  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  File? _image;
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

  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final pincodeController = TextEditingController();
  @override
  void dispose() {
    super.dispose();

    phoneController.dispose();
    addressController.dispose();
    nameController.dispose();
    usernameController.dispose();
    pincodeController.dispose();
  }

  String name = '';
  String image = '';
  late int pincode;
  late int phoneno;
  String username = '';
  String address = '';
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
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF6F35A5),
      ),
      body: FutureBuilder<UserModel>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel users = snapshot.data as UserModel;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  : Image(image: NetworkImage(users.image)),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) =>
                                        bottomSheet(context)));
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 15),
                        child: TextFormField(
                          enabled: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          initialValue: users.email,
                          decoration: const InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.email),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          cursorColor: kPrimaryColor,
                          //initialValue: users.name,
                          controller: nameController,
                          autofocus: false,
                          decoration: const InputDecoration(
                            hintText: "Name to Edit",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,

                          //initialValue: users.address,
                          autofocus: false,
                          decoration: const InputDecoration(
                            hintText: "Address to Edit",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.home),
                            ),
                          ),
                          controller: addressController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          controller: phoneController,
                          autofocus: false,
                          decoration: const InputDecoration(
                            hintText: "Phone no to edit",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.phone),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: usernameController,
                          cursorColor: kPrimaryColor,
                          autofocus: false,
                          decoration: const InputDecoration(
                            hintText: "Username to edit",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.account_circle),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: pincodeController,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          autofocus: false,
                          decoration: const InputDecoration(
                            hintText: "pinocde to edit",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.pin_drop_outlined),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (imageUrl == null) {
                              image = users.image;
                            } else {
                              image = imageUrl;
                            }
                            if (nameController.text.toString() == null) {
                              name = users.name;
                            } else {
                              name = nameController.text.trim();
                            }
                            if (phoneController.text.toString() == null) {
                              phoneno = users.phoneno;
                            } else {
                              phoneno = int.parse(phoneController.text);
                            }
                            if (addressController.text.toString() == null) {
                              address = users.address;
                            } else {
                              address = addressController.text.trim();
                            }
                            if (usernameController.text.toString() == null) {
                              username = users.username;
                            } else {
                              username = usernameController.text.trim();
                            }
                            if (pincodeController.text.toString() == null) {
                              pincode = users.pincode;
                            } else {
                              pincode = int.parse(pincodeController.text);
                            }
                            final docUser = FirebaseFirestore.instance
                                .collection('user')
                                .doc(users.id);
                            docUser.update({
                              'image': image,
                              'name': name,
                              'pincode': pincode,
                              'address': address,
                              'username': username,
                              'phoneno': phoneno,
                              'id': users.id,
                              'email': users.email
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor),
                          child: Text(
                            'Upadte Profile',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("Error"),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
        future: getData(),
      ),
    );
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
                icon: const Icon(
                  Icons.camera,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  getImage(ImageSource.camera, context);
                },
                label: const Text(
                  "Camera",
                  style: TextStyle(color: kPrimaryColor),
                ),
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
          )
        ],
      ),
    );
  }
}
