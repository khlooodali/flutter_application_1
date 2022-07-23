import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/allertdialog.dart';
import 'package:flutter_application_1/doctors/alldoctor.dart';
import 'package:flutter_application_1/pharmcy/pharmcy.dart';
import 'package:flutter_application_1/screens/Scanpage.dart';
import 'package:flutter_application_1/screens/aboutus.dart';
import 'package:flutter_application_1/screens/contactus.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/help.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/instructions.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';
import 'package:flutter_application_1/screens/splachScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../X-Ray/displayrays.dart';

class pages extends StatefulWidget {
  @override
  State<pages> createState() => _pagesState();
}

class _pagesState extends State<pages> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ispatient ? Colors.pink[200] : Colors.blue[200],
        title: Text(
          'Pages',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Colors.grey,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
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
                  MaterialPageRoute(builder: (context) => LoginSignupScreen()),
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
                  MaterialPageRoute(builder: (context) => LoginSignupScreen()),
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
                  MaterialPageRoute(builder: (context) => HomePageScreen()),
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
                var dialog = CustomAlertDialog(
                    title: "Logout",
                    message: "Are you sure, do you want to logout?",
                    onPostivePressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Splash_screen()),
                      );
                    },
                    onNegativePressed: () {
                      Navigator.of(context).pop();
                    },
                    positiveBtnText: 'yes',
                    negativeBtnText: "No",
                    bgColor: Colors.white,
                    circularBorderRadius: 15.0);
                showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog);
              },
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
