import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/X-Ray/displayrays.dart';
import 'package:flutter_application_1/doctors/doclogin.dart';
import 'package:flutter_application_1/doctors/signupdoc.dart';
import 'package:flutter_application_1/doctors/splach.dart';
import 'package:flutter_application_1/pharmcy/pharmcy.dart';
import 'package:flutter_application_1/screens/Scanpage.dart';
import 'package:flutter_application_1/screens/aboutus.dart';
import 'package:flutter_application_1/screens/contactus.dart';
import 'package:flutter_application_1/screens/help.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/instructions.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';

import '../screens/continueas.dart';

ListView Drawerr(BuildContext context) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Text(
          'pages',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'login',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ispatient ? LoginSignupScreen() : doclogin()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'Sign up',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ispatient ? LoginSignupScreen() : Signdoc()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text('Home',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text('About us',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => about_us()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'Help',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Gethelp()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'Contact us',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Help()),
            );
          },
        ),
      ),
      /* Card(
          child: ListTile(
            title: const Text(
              'Appoinment',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => appoinement()),
              );
            },
          ),
        ), */
      Card(
        child: ListTile(
          title: const Text(
            'Instructions',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => instructions()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'Pharmacy',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pharmcy()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'Doctors',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'Scan',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Scan()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'X-ray Centers',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Rays()),
            );
          },
        ),
      ),
      Card(
        child: ListTile(
          title: const Text(
            'log out',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Continue()),
            );
          },
        ),
      ),
    ],
  );
}
