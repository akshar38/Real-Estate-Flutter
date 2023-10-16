import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/provider/FireBaseService.dart';
import 'package:flutter_auth/provider/ProductProvider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../../components/user.dart';
import '../CustomSearchDelegate.dart';
import 'CategoryButton.dart';
import 'HostelAllDetail.dart';
import 'HosueAllDetail.dart';
import 'LandAllDetail.dart';
import 'PGAllDetail.dart';

class LandDetail extends StatefulWidget {
  final String category;

  static String id = 'detail';
  LandDetail({Key? key, required this.category}) : super(key: key);
  _LandDetail createState() => _LandDetail();
}

final _format = NumberFormat('##,##,##,##0');

class _LandDetail extends State<LandDetail> {
  @override
  Widget build(BuildContext context) {
    var _productProvider = Provider.of<ProductProvider>(context);
    var data = _productProvider.productdata;
    int length = data['Propertyimage'].length;
    var price = data!['Propertyprice'];
    String formatedprice = '${_format.format(price)}';
    Future<UserModel> getData() async {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where("id", isEqualTo: data['email'])
          .get();
      final userData = snapshot.docs.map((e) => UserModel.fromJson(e)).single;
      print('${userData}');
      return userData;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),

        backgroundColor: kPrimaryColor,
        // ignore: prefer_const_constructors
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ), //IconButton
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              //Navigator.pushNamed(context, FavouriteScreen.id);
            },
          ), //IconButton
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 251, 227, 255)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ImageSlideshow(
                  width: double.infinity,
                  initialPage: 0,
                  indicatorColor: kPrimaryColor,
                  indicatorBackgroundColor: Colors.grey,
                  autoPlayInterval: 10000,
                  isLoop: true,
                  children: [
                    for (var i = 0; i < length; i++)
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data['Propertyimage'][i]),
                                fit: BoxFit.fill)),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 10, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Property for sale ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 213, 61, 230),
                          fontStyle: FontStyle.italic),
                    ),
                    Text(data['Propertyname'],
                        style: const TextStyle(
                            color: kPrimaryColor, fontSize: 22)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        color: Color.fromARGB(255, 213, 61, 230),
                        size: 22,
                      ),
                      Text(
                        '${formatedprice}'.toString(),
                        style:
                            const TextStyle(color: kPrimaryColor, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Color.fromARGB(255, 247, 203, 255),
              //   ),
              //   width: double.infinity,
              //   child: Column(
              //     //mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.fromLTRB(27, 5, 0, 0),
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: kPrimaryColor,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: Padding(
              //             padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              //             child: Text(
              //               'Property Details :',
              //               style: TextStyle(color: Colors.white, fontSize: 16),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 140,
              //         child: ListView(
              //           scrollDirection: Axis.horizontal,
              //           children: [
              //             CategoryButton(
              //               image:
              //                   "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-bedroom-interior-64%20(1).png?alt=media&token=9d652a44-f606-4c62-8e61-fc2a765b5641",
              //               title: data['category'] == 'Hostel'
              //                   ? data['type'] + ' Hostel'
              //                   : data['type'] + ' PG',
              //             ),
              //             if (data['category'] == 'PG')
              //               CategoryButton(
              //                 image:
              //                     "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-bedroom-interior-64%20(1).png?alt=media&token=9d652a44-f606-4c62-8e61-fc2a765b5641",
              //                 title: data['noOfBedRoom'] + ' BedRooms',
              //               ),
              //             if (data['category'] == 'Hostel')
              //               for (var i = 0; i < data['roomType'].length; i++)
              //                 CategoryButton(
              //                   image: items[data['roomType'][i]]!,
              //                   title: data['roomType'][i] + ' Rooms',
              //                 ),
              //             CategoryButton(
              //               image:
              //                   "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-bathroom-64%20(1).png?alt=media&token=4b940886-af16-4d49-bee9-838fc86890dc",
              //               title: data['category'] == 'Hostel'
              //                   ? data['bathroomType']
              //                   : data['noOfBathRoom'] + ' BathRoom',
              //             ),
              //             if (data['category'] == 'PG')
              //               CategoryButton(
              //                 image:
              //                     "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-parking-64.png?alt=media&token=83aa0600-461d-42e1-9f48-ccf2e96c22bd",
              //                 title: data['noOfParking'] + ' Parking',
              //               ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                height: 435,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 172, 255),
                    borderRadius: BorderRadius.circular(20)),
                child: Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Column(
                      children: [
                        // Container(
                        //   height: 70,
                        //   child: Container(
                        //     height: 40,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(15),
                        //         color: kPrimaryColor),
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: const [
                        //         Image(
                        //             image: NetworkImage(
                        //                 "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-goal-60.png?alt=media&token=aa228714-3f49-435c-a778-ad72b497291c")),
                        //         Padding(
                        //           padding: EdgeInsets.fromLTRB(15, 20, 0, 2),
                        //           child: Text(
                        //             'Other Key Highlight :',
                        //             style: TextStyle(
                        //                 color: Colors.white, fontSize: 23),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: kPrimaryLightColor,
                        //       borderRadius: BorderRadius.circular(20)),
                        //   child: Column(
                        //     children: [
                        //       for (var i = 0;
                        //           i < data['OtherCategory'].length;
                        //           i++)
                        //         Row(
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.fromLTRB(
                        //                   30, 5, 20, 10),
                        //               child: Container(
                        //                 height: 30,
                        //                 child: Image(
                        //                     image: NetworkImage(items[
                        //                         data['OtherCategory'][i]]!)),
                        //               ),
                        //             ),
                        //             Text(
                        //               data['OtherCategory'][i],
                        //               style: TextStyle(color: kPrimaryColor),
                        //             ),
                        //           ],
                        //         ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 320,
                        //   child: Padding(
                        //     padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Container(
                        //           height: 70,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(15),
                        //               color: kPrimaryColor),
                        //           child: Row(
                        //             children: const [
                        //               Padding(
                        //                 padding:
                        //                     EdgeInsets.fromLTRB(5, 0, 0, 0),
                        //                 child: Image(
                        //                     image: NetworkImage(
                        //                         "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-home-decor-60.png?alt=media&token=79edd78c-616f-4726-be28-af3747fd1add")),
                        //               ),
                        //               Padding(
                        //                 padding:
                        //                     EdgeInsets.fromLTRB(15, 5, 0, 0),
                        //                 child: Text(
                        //                   'Property Decor :',
                        //                   style: TextStyle(
                        //                       color: Colors.white,
                        //                       fontSize: 23),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Container(
                        //           height: 200,
                        //           decoration: BoxDecoration(
                        //               color: kPrimaryLightColor,
                        //               borderRadius: BorderRadius.circular(20)),
                        //           child: ListView(
                        //             scrollDirection: Axis.vertical,
                        //             children: [
                        //               for (var i = 0;
                        //                   i < data['decor'].length;
                        //                   i++)
                        //                 Container(
                        //                   margin: const EdgeInsets.fromLTRB(
                        //                       10.0, 0, 10, 0),
                        //                   //padding: const EdgeInsets.all(8.0),
                        //                   width: 80,
                        //                   height: 50,

                        //                   child: Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.start,
                        //                     //crossAxisAlignment: CrossAxisAlignment.center,
                        //                     children: [
                        //                       Padding(
                        //                         padding:
                        //                             const EdgeInsets.fromLTRB(
                        //                                 15, 5, 15, 0),
                        //                         child: Image.network(
                        //                             items[data['decor'][i]] ??
                        //                                 ''),
                        //                       ),
                        //                       Text(
                        //                         data['decor'][i],
                        //                         style: const TextStyle(
                        //                           color: kPrimaryColor,
                        //                           fontSize: 15,
                        //                         ),
                        //                         textAlign: TextAlign.center,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: 350,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: kPrimaryColor),
                                  child: Row(
                                    children: const [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        child: Image(
                                            image: NetworkImage(
                                                "https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-more-details-60.png?alt=media&token=7815453e-d0e5-4566-b7be-1c706304193b")),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 0, 0),
                                        child: Text(
                                          'All Details :',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 260,
                                  decoration: BoxDecoration(
                                      color: kPrimaryLightColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: LandAllDetail(data: data),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 247, 203, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            'Seller Info :',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      FutureBuilder<UserModel>(
                        builder: (context, snapshot) {
                          UserModel users = snapshot.data as UserModel;
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Container(
                              height: 100,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      users.image ?? '',
                                      fit: BoxFit.cover,
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.account_circle,
                                              color: kPrimaryColor,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              users.name,
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: kPrimaryColor,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              users.phoneno.toString(),
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        future: getData(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          cursorColor: kPrimaryColor,
                          enabled: false,
                          //maxLength: 200,
                          maxLines: 3,
                          initialValue: data['other'],
                          //controller: otherController,
                          decoration: InputDecoration(
                            labelText: "Other Specification",
                            labelStyle: TextStyle(color: kPrimaryColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  width: 5, color: kPrimaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(color: kPrimaryBackGroundColor),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(40, 40),
                          backgroundColor: kPrimaryColor),
                      child: Text(
                        'Chat',
                        style: TextStyle(color: Colors.white),
                      )),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(40, 40),
                          backgroundColor: kPrimaryColor),
                      child: Text(
                        'Call',
                        style: TextStyle(color: Colors.white),
                      )),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
