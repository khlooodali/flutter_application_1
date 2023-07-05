import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/allertdialog.dart';
import 'package:flutter_application_1/constants/pallete.dart';
import 'package:flutter_application_1/screens/forgetpassword.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/pageview.dart';
import 'package:flutter_application_1/screens/user.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedpref;

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // list with option

  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  final _controller7 = TextEditingController();

  final _controller8 = TextEditingController();
  final _type = TextEditingController();

  bool visablepassword = true;

  final GlobalKey<FormState> _formkey1 = GlobalKey();
  final GlobalKey<FormState> _formkey2 = GlobalKey();

  String dep = '';

  @override
  void initState() {
    _controller.text = "";
    super.initState();
  }

  autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loggedIn = prefs.getBool('loggedIn');

    if (loggedIn == true) {
      return Home();
    } else {
      return LoginSignupScreen();
    }
  }

  Future login() async {
    var res = await http.post(
        Uri.parse(
            'https://backendsda.herokuapp.com/api/v1/patient/patientLogin'),
        body: <String, String>{
          'patient_email': user.patient_email,
          'patient_password': user.patient_password,
        });
    if (res.statusCode != 200) {
      sharedpref = await SharedPreferences.getInstance();
      sharedpref.setBool("isLoggedIn", true);
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
      print(res.body);

      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => pageView()));
    }
  }

  Future save() async {
    if (_formkey1.currentState!.validate()) {
      var res = await http.post(
          Uri.parse(
              'https://backendsda.herokuapp.com/api/v1/patient/addPatient'),
          body: <String, String>{
            'patient_email': user.patient_email,
            'patient_password': user.patient_password,
            'name': user.name,
            'DOB': _controller.text,
            'history_of_disease': user.history_of_disease,
            'disease_type': user.disease_type,
            'status': user.status,
            'phone': user.phone
          });

      print(res.body);

      var dialog = CustomAlertDialog(
          title: "Signed UP Successfuly",
          message: "you can Login in Our App ",
          onPostivePressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => LoginSignupScreen()));
          },
          onNegativePressed: () {
            Navigator.of(context).pop();
          },
          positiveBtnText: 'ok',
          negativeBtnText: "Cancel",
          bgColor: Colors.white,
          circularBorderRadius: 15.0);
      showDialog(context: context, builder: (BuildContext context) => dialog);
    }
  }

  User user = User('', '', '', '', '', '', '', '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/breast-cancer.jpg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: const Color.fromRGBO(197, 55, 101, .85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                              text:
                                  isSignupScreen ? " Breast Cancer" : " Back ",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup to Continue"
                          : "Signin to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),

          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.pink,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.pink,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection(),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Form(
              key: _formkey2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller:
                          TextEditingController(text: user.patient_email),
                      onChanged: (value) {
                        user.patient_email = value;
                      },
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
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Palette.textColor1),
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintStyle:
                            TextStyle(fontSize: 14, color: Palette.textColor1),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller:
                          TextEditingController(text: user.patient_password),
                      onChanged: (value) {
                        user.patient_password = value;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length <= 5) {
                          return 'please enter strong password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
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
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return Reset();
                  }));
                },
                child: Text("Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Form(
                key: _formkey1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: TextEditingController(text: user.name),
                        onChanged: (value) {
                          user.name = value;
                        },
                        textAlign: (TextAlign.left),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          prefixIcon: Icon(Icons.account_box_rounded),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:
                            TextEditingController(text: user.patient_email),
                        onChanged: (value) {
                          user.patient_email = value;
                        },
                        textAlign: (TextAlign.left),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: TextEditingController(text: user.phone),
                        onChanged: (value) {
                          user.phone = value;
                        },
                        textAlign: (TextAlign.left),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your phone number';
                          } else if (value.length < 11) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Your Phone",
                          prefixIcon: Icon(Icons.call),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controller,
                        //// onChanged: (value) {
                        //user.DOB = value;
                        //},
                        textAlign: (TextAlign.left),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your birthday';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "yyyy-MM-dd",
                          prefixIcon: Icon(Icons.calendar_today),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1973),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);

                            setState(() {
                              _controller.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        //keyboardType: TextInputType.datetime,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:
                            TextEditingController(text: user.patient_password),
                        onChanged: (value) {
                          user.patient_password = value;
                        },
                        textAlign: (TextAlign.left),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length <= 5) {
                            return 'please enter Strong password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.textColor1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.textColor1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(
                                fontSize: 14, color: Palette.textColor1),
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
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:
                            TextEditingController(text: user.disease_type),
                        onChanged: (value) {
                          user.disease_type = value;
                        },
                        textAlign: (TextAlign.left),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'select One';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Type of disease none, benign, malignant",
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
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: TextEditingController(
                            text: user.history_of_disease),
                        onChanged: (value) {
                          user.history_of_disease = value;
                        },
                        textAlign: (TextAlign.left),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'select One';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "genetic or non-genetic",
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
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: TextEditingController(text: user.status),
                        onChanged: (value) {
                          user.status = value;
                        },
                        textAlign: (TextAlign.left),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'select One';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "normal ,patient ,recover",
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
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 700),
        curve: Curves.bounceInOut,
        top: isSignupScreen ? 535 : 430,
        right: 0,
        left: 0,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 90,
              width: 90,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    if (showShadow)
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1.5,
                        blurRadius: 10,
                      )
                  ]),
              child: !showShadow
                  ? Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.pink, Colors.grey],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1))
                          ]),
                      child: FlatButton(
                        onPressed: () {
                          //signup as patient
                          if (isSignupScreen) {
                            save();
                          }
                          //login
                          else {
                            login();
                          }
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Center(),
            ),
          ),
        ));
  }
}
