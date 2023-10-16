import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Favourites/FavouriteScreen.dart';
import 'package:flutter_auth/Screens/HomePage/MainScreen.dart';
import 'package:flutter_auth/Screens/HomePage/home_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Search/SearchResult.dart';
import 'package:flutter_auth/Screens/Signup/VerifyEmail.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/SplashScreen.dart';
import 'package:flutter_auth/Screens/message/ChatScreen.dart';
import 'package:flutter_auth/Screens/profile/ViewProfile.dart';
import 'package:flutter_auth/Screens/profile/edit_screen.dart';
import 'package:flutter_auth/Screens/profile/profile_page.dart';
import 'package:flutter_auth/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/Screens/list%20property/Addpropertypage.dart';
import 'package:flutter_auth/provider/Auth_Page.dart';
import 'package:flutter_auth/provider/ProductProvider.dart';
import 'package:flutter_auth/provider/auth.dart';
import 'package:flutter_auth/provider/google_sign_in.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'Screens/Registration/registration_screen.dart';
import 'Screens/location/loacation-screen.dart';
import 'Screens/HomePage/CustomSearchDelegate.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;

  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ProductProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          title: 'RealEstate',
          theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: kPrimaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size(double.infinity, 56),
                  minimumSize: const Size(double.infinity, 56),
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: kPrimaryLightColor,
                iconColor: kPrimaryColor,
                prefixIconColor: kPrimaryColor,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none,
                ),
              )),
          initialRoute: SplashScreen.id,
          routes: {
            VerifyEmailPage.id: (context) => VerifyEmailPage(),
            AuthPage.id: (context) => AuthPage(),
            RegisterUserCheck.id: (context) => RegisterUserCheck(),
            LoginScreen.id: (context) => const LoginScreen(),
            SignUpScreen.id: (context) => SignUpScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            ProfileScreen.id: (context) => const ProfileScreen(),
            RegistrationScreen.id: (context) => RegistrationScreen(),
            EditScreen.id: (context) => const EditScreen(),
            AddNewPropertyPage.id: (context) => AddNewPropertyPage(),
            ChatScreen.id: (context) => ChatScreen(),
            MainScreen.id: (context) => MainScreen(),
            LocationScreen.id: (context) => LocationScreen(),
            FavouriteScreen.id: (context) => FavouriteScreen(),
            ViewProfile.id: (context) => ViewProfile(),
            //SearchResult.id: (context) => SearchResult(city: query),
          },
        ),
      );
}
