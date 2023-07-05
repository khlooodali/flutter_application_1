import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/allertdialog.dart';
import 'package:flutter_application_1/constants/drawer.dart';
import 'package:flutter_application_1/constants/pallete.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/homepage.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'aboutus.dart';

//import 'package:image_picker/image_picker.dart';

class Help extends StatefulWidget {
  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  bool _validation1 = false;
  final _controller3 = TextEditingController();
  bool _validation3 = false;

  bool _validation2 = false;
  final GlobalKey<FormState> _formkey = GlobalKey();

  var url = "https://www.facebook.com/khloud.ali.5836";

  Future send() async {
    var res = await http.post(
        Uri.parse('https://backendsda.herokuapp.com/api/v1/contact/contactus'),
        body: <String, String>{
          'name': _controller1.text,
          'email': _controller2.text,
          'message': _controller3.text,
        });

    print(res.body);

    var dialog = CustomAlertDialog(
        title: "Message send Successfuly",
        message: "",
        onPostivePressed: () {
          Navigator.of(context).pop();
        },
        onNegativePressed: () {},
        positiveBtnText: 'ok',
        negativeBtnText: "",
        bgColor: Colors.white,
        circularBorderRadius: 15.0);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ispatient ? Colors.pink[200] : Colors.blue[200],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Colors.grey,
        ),
      ),
      body: Container(
          color: Colors.white,
          height: double.infinity,
          child: SafeArea(
              child: Center(
                  //child: SingleChildScrollView(
                  //child: Padding(
                  //padding: const EdgeInsets.all(8.0),
                  child: ListView(children: [
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Center(
                  child: Padding(
                padding:
                    EdgeInsets.only(top: 40, bottom: 40, left: 25, right: 25),
                child: Center(
                  child: Card(
                    color: ispatient ? Colors.pink[100] : Colors.blue[100],
                    semanticContainer: true,
                    elevation: 20,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Send Us a message',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _controller1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter your name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: " Name",
                              prefixIcon: Icon(Icons.account_box_rounded),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Palette.textColor1),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _controller2,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              errorText: _validation2 ? 'Invalid email' : null,
                              prefixIcon: Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _controller3,
                            decoration: InputDecoration(
                              hintText: 'Message',
                              errorText: _validation3
                                  ? 'please enter your message'
                                  : null,
                              prefixIcon: Icon(Icons.message),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: double.infinity,
                            child: RaisedButton(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0))),
                              onPressed: () {
                                send();
                                setState(() {
                                  if (_controller1.text.isEmpty ||
                                      !_controller1.text
                                          .contains('@gmail.com')) {
                                    _validation1 = true;
                                  } else {
                                    _validation1 = false;
                                  }
                                  if (_controller2.text.isEmpty ||
                                      _controller2.text.length <= 5) {
                                    _validation2 = true;
                                  } else {
                                    _validation2 = false;
                                  }
                                  if (_controller3.text.isEmpty) {
                                    _validation3 = true;
                                  } else {
                                    _validation3 = false;
                                  }
                                  print(_controller1.text);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ),
          ])))),
      drawer: Drawer(
        child: Drawerr(context),
      ),
    );
  }
}
