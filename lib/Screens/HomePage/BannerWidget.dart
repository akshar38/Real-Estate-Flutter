import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .25,
        color: kPrimaryBackGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Property',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              letterSpacing: 1,
                              fontSize: 22),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 45,
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                FadeAnimatedText(
                                    "Reach 1 Lakh+ \nInterested Buyers",
                                    duration: Duration(seconds: 5)),
                                FadeAnimatedText(
                                    'New way to \nBuy or Sell Property',
                                    duration: Duration(seconds: 5)),
                                FadeAnimatedText(
                                    'Over 1k+ \nnew Property to buy',
                                    duration: Duration(seconds: 5)),
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Neumorphic(
                        style: NeumorphicStyle(
                          color: Colors.white,
                        ),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/h2.png'),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(40, 40),
                        backgroundColor: kPrimaryColor),
                    child: Text(
                      'Buy',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(40, 40),
                        backgroundColor: kPrimaryColor),
                    child: Text('Sell',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
