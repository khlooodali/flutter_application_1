import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/allertdialog.dart';
import 'package:flutter_application_1/doctors/doclogin.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/restpassword.dart';
import 'package:flutter_application_1/screens/user.dart';
import 'loginandsign.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Reset extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _reset();
  }
}

class _reset extends State<Reset> {
  final _controller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  bool _validation = false;
  User user = User('', '', '', '', '', '', '', '');

  Future Forgetp() async {
    var res = await http.post(
        Uri.parse('https://backendsda.herokuapp.com/api/v1/patient/forgetpass'),
        body: <String, String>{
          'patient_email': _controller.text,
        });
    if (res.statusCode == 200) {
      print(res.body);
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Resetpass()));
    } else {
      var dialog = CustomAlertDialog(
          title: "",
          message: "Invalid Email",
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
  }

  Future Forgetd() async {
    var res = await http.post(
        Uri.parse(
            'https://backendsda.herokuapp.com/api/v1/doctor/forgetPassword'),
        body: <String, String>{
          'email': _controller.text,
        });
    if (res.statusCode != 200) {
      var dialog = CustomAlertDialog(
          title: "",
          message: "Invalid Email",
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
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Resetpass()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ispatient
                  ? AssetImage("assets/img1.jpeg")
                  : AssetImage("assets/onBoardDoc.png"),
              fit: ispatient ? BoxFit.cover : null,
            ),
          ),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (_) {
                            return ispatient ? LoginSignupScreen() : doclogin();
                          }));
                        },
                        icon: Icon(Icons.arrow_back))),
              ),
              Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Text(
                        'Forget Password',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Enter your email to reset  your password'),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Email",
                            errorText:
                                _validation ? 'Value Can\'t Be Empty' : null,
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 330,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                              color: ispatient
                                  ? Colors.pink[100]
                                  : Colors.lightBlue[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextButton(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              onPressed: () {
                                ispatient ? Forgetp() : Forgetd();
                                setState(() {
                                  if (!_controller.text
                                          .contains('@gmail.com') ||
                                      _controller.text.isEmpty) {
                                    _validation = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
