import 'package:flutter/material.dart';
import 'package:flutter_application_1/X-Ray/displayrays.dart';

import 'package:flutter_application_1/doctors/splach.dart';
import 'package:flutter_application_1/massages/allmassages.dart';

import 'package:flutter_application_1/pharmcy/pharmcy.dart';
import 'package:flutter_application_1/screens/Scanpage.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';
import 'package:flutter_application_1/screens/splachScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref = await SharedPreferences.getInstance();
  var status = sharedpref.getBool('isLoggedIn') ?? false;
  print(status);
  runApp(MaterialApp(
      routes: {
        "login": (context) => LoginSignupScreen(),
        "home": (context) => Home()
      },
      debugShowCheckedModeBanner: false,
      home: status == true ? Splash_screen() : Home()));

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // constructor
  // build

  @override
  /* Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_screen(),
      routes: {
        "pharmcy": (context) => Pharmcy(),
        "Rays": (context) => Rays(),
      },
    );
  } */
}
