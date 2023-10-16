import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/details/HostelPGDetail.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/provider/ProductProvider.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../provider/FireBaseService.dart';
import '../HomePage/details/LandDeatil.dart';
import '../HomePage/details/ProductDetail.dart';
import '../HomePage/details/ShopOfficeDetail.dart';

class AdScreen extends StatefulWidget {
  final AsyncSnapshot<QuerySnapshot> snapshot;
  AdScreen({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  FireBaseService _service = FireBaseService();
  bool _isLiked = false;
  final _format = NumberFormat('##,##,##,##0');

  Widget build(BuildContext context) {
    var _provider = Provider.of<ProductProvider>(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 2 / 2.9,
      ),
      itemCount: widget.snapshot.data?.size,
      itemBuilder: (BuildContext context, int i) {
        var pdata = widget.snapshot.data?.docs[i];
        var price = pdata!['Propertyprice'];
        String formatedprice = '${_format.format(price)}';
        return Stack(
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 245, 255, 1),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey, width: .5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(pdata['Propertyimage'][0]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(7) //image stored,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: Text(
                        pdata['Propertyname'],
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                      child: Text(
                        formatedprice,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          pdata['city'],
                          style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {
                _provider.getProductDetails(pdata);
                if (pdata['category'] == 'House' ||
                    pdata['category'] == 'Rent' ||
                    pdata['category'] == 'Flat')
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetail(
                            category: pdata['category'],
                          )));
                else if (pdata['category'] == 'Hostel' ||
                    pdata['category'] == 'PG')
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HostelPGDetail(
                            category: pdata['category'],
                          )));
                else if (pdata['category'] == 'Land') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LandDetail(
                            category: pdata['category'],
                          )));
                } else if (pdata['category'] == 'Shop' ||
                    pdata['category'] == 'Office') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShopOfficeDetail(
                            category: pdata['category'],
                          )));
                }
              },
            ),
            Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                onTap: () {
                  _isLiked = !_isLiked;
                  print(_isLiked);
                  setState(() {
                    _service.updateFavourite(_isLiked, pdata['id'], context);
                  });
                },
                child: LikeButton(
                  circleColor: CircleColor(
                      start: kPrimaryLightColor, end: kPrimaryLightColor),
                  bubblesColor: BubblesColor(
                      dotPrimaryColor: kPrimaryBackGroundColor,
                      dotSecondaryColor: kPrimaryBackGroundColor),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? kPrimaryColor : Colors.white,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> onLikeButtonTapped(bool isLiked) async {
    setState(() {
      //_service.updateFavourite(isLiked, id, context);
    });
    return !isLiked;
  }
}
