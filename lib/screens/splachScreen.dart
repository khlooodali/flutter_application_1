import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/continueas.dart';

class Splash_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: EasySplashScreen(
        logo: Image.asset(
          'assets/s7.gif',
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
        logoSize: 180,
        backgroundColor: Colors.black,
        showLoader: true,
        loaderColor: Colors.white,
        loadingText: Text(
          "Loading...",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        navigator: Continue(),
        durationInSeconds: 4,
      ),
    );
  }
}
