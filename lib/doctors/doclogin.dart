import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/allertdialog.dart';
import 'package:flutter_application_1/constants/pallete.dart';
import 'package:flutter_application_1/doctors/profile.dart';
import 'package:flutter_application_1/doctors/signupdoc.dart';
import 'package:flutter_application_1/screens/forgetpassword.dart';
import 'package:flutter_application_1/screens/user.dart';
import 'package:http/http.dart' as http;

class doclogin extends StatefulWidget {
  @override
  State<doclogin> createState() => _doclogin();
}

class _doclogin extends State<doclogin> {
  final _docemail = TextEditingController();
  final _docpass = TextEditingController();
  bool visablepassword = true;
  final GlobalKey<FormState> _formkey = GlobalKey();

  Future logindoctor() async {
    var res = await http.post(
        Uri.parse('https://procanecer.herokuapp.com/api/v1/doctor/logindoctor'),
        body: <String, String>{
          'email': _docemail.text,
          'password': _docpass.text,
        });

    if (res.statusCode != 200) {
      var dialog = CustomAlertDialog(
          title: "Fail to login",
          message: "Invalid Email Or Password..",
          onPostivePressed: () {
            Navigator.of(context).pop();
          },
          onNegativePressed: () {},
          positiveBtnText: 'ok',
          negativeBtnText: "",
          bgColor: Colors.white,
          circularBorderRadius: 15.0);
      showDialog(context: context, builder: (BuildContext context) => dialog);
    } else {
      var data = json.decode(res.body);
      print(res.body);
      print(data[User]['name']);

      /* Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => profile()));  */ //لسه هعمل البروفايل
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 52, 93),
        body: SafeArea(
          child: Stack(children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  height: 200,
                  child: Center(
                      child: Text(
                    'Welcome to Breat Cancer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 250, right: 10, left: 10),
              child: Container(
                height: double.infinity,
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _docemail,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@gmail.com')) {
                              return 'please enter your Email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.textColor1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.textColor1),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(
                                fontSize: 14, color: Palette.textColor1),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 330),
              child: TextFormField(
                controller: _docpass,
                textAlign: (TextAlign.left),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length <= 5) {
                    return 'Wrong password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintStyle:
                        TextStyle(fontSize: 14, color: Palette.textColor1),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visablepassword = !visablepassword;
                          });
                        },
                        icon: Icon(visablepassword
                            ? Icons.visibility
                            : Icons.visibility_off))),
                keyboardType: TextInputType.visiblePassword,
                obscureText: visablepassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, right: 20, left: 200),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) {
                      return Reset();
                    }));
                  },
                  child: Text(
                    'Forget password',
                    style: TextStyle(color: Palette.textColor1, fontSize: 15),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 480, left: 20, right: 20),
              child: bttn(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 570, left: 70, right: 20),
              child: Row(
                children: [
                  Text(
                    "Don`t have account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Signdoc()));
                      },
                      child: Text("Sign up"))
                ],
              ),
            ),
          ]),
        ));
    throw UnimplementedError();
  }

  Container bttn() {
    return Container(
      width: 400,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                logindoctor();
              }
            }),
      ),
    );
  }
}
