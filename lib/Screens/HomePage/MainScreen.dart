import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Favourites/FavouriteScreen.dart';
import 'package:flutter_auth/Screens/HomePage/home_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/SplashScreen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/message/ChatScreen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/Screens/list%20property/Addpropertypage.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main screen';
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  late PageController _pageController;

  int _Page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          children: <Widget>[
            HomeScreen(),
            AddNewPropertyPage(),
            ChatScreen(),
            FavouriteScreen(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          }),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOutBack,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined, color: Colors.white),
            label: 'Home',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: 'Add Property',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
            child: Icon(Icons.chat_bubble_outline, color: Colors.white),
            label: 'Chat',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.favorite, color: Colors.white),
            label: 'Ads',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ],
        color: kPrimaryColor,
        backgroundColor: Colors.white,
        height: 60.0,
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
