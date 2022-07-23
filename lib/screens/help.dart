import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/drawer.dart';
import 'package:flutter_application_1/screens/contactus.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/reportproblem.dart';

class Gethelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ispatient ? Colors.pink[200] : Colors.blue[200],
          title: Text(
            'Get Help',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            opacity: .8,
            fit: BoxFit.fill,
            image: ispatient
                ? AssetImage(
                    "assets/photo3.jpg",
                  )
                : AssetImage("assets/restd.jpg"),
          )),
          child: Padding(
            padding: EdgeInsets.all(0.8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 8),
                    child: Center(
                      child: Text('Is there any problem ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 8),
                    child: Center(
                      child: Text('Or a complaint you want to report?',
                          style: TextStyle(
                            fontSize: 15,
                            //fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Report()),
                            );
                          },
                          child: Center(
                            child: Text(
                              'Report a problem',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          elevation: 5,
                          color: Colors.grey.withOpacity(.85)),
                    )),
                SizedBox(
                  height: 250,
                ),
                Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Help()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 50,
                  ),
                  color: Colors.grey.withOpacity(.85),
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: Drawerr(context),
        ));
  }
}
