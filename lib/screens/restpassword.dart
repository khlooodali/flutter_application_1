
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/allertdialog.dart';
import 'package:flutter_application_1/doctors/doclogin.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/forgetpassword.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Resetpass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _resetpass();
  }
}

class _resetpass extends State<Resetpass> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  bool _validation = false;
  bool visablepassword = true;

  Future Restp() async {
    var res = await http.post(
        Uri.parse('https://procanecer.herokuapp.com/api/v1/patient/resetpass'),
        body: <String, String>{
          'patient_email': _controller.text,
          'newPassword': _controller1.text,
          'confirmPassword': _controller2.text,
        });
    if (res.statusCode == 200) {
      print(res.body);
      var dialog = CustomAlertDialog(
          title: "Your password Rest Successfuly",
          message: "you can login with new password",
          onPostivePressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => LoginSignupScreen()));
          },
          onNegativePressed: () {},
          
          positiveBtnText: 'ok',
          negativeBtnText: "",
          bgColor: Colors.white,
          circularBorderRadius: 15.0);
      showDialog(context: context, builder: (BuildContext context) => dialog);
    }
  }

  Future Restd() async {
    var res = await http.post(
        Uri.parse(
            'https://procanecer.herokuapp.com/api/v1/doctor/resetpassword'),
        body: <String, String>{
          'patient_email': _controller.text,
          'newPassword': _controller1.text,
          'confirmPassword': _controller2.text,
        });
    if (res.statusCode == 200) {
      print(res.body);
      var dialog = CustomAlertDialog(
          title: "Your password Rest Successfuly",
          message: "you can login with new password",
          onPostivePressed: () {
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => doclogin()));
          },
          onNegativePressed: () {},
          positiveBtnText: 'ok',
          negativeBtnText: "",
          bgColor: Colors.white,
          circularBorderRadius: 15.0);
      showDialog(context: context, builder: (BuildContext context) => dialog);
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
                            return Reset();
                          }));
                        },
                        icon: Icon(Icons.arrow_back))),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'ResetPassword',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Enter a new password '),
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
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _controller1,
                        decoration: InputDecoration(
                            hintText: "New Password",
                            errorText:
                                _validation ? 'enter new password' : null,
                            prefixIcon: Icon(Icons.lock),
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
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _controller2,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          errorText: _validation
                              ? 'please confirm your password'
                              : null,
                          prefixIcon: Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: visablepassword,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 100,
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
                              'Reset password',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            onPressed: () {
                              ispatient ? Restp() : Restd();
                              setState(() {
                                if (_controller.text.isEmpty ||
                                    _controller1.text.isEmpty) {
                                  _validation = true;
                                } else {
                                  _validation = false;
                                }
                                if (_controller1.text != _controller2.text) {
                                  var dialog = CustomAlertDialog(
                                      title: "Confirm password",
                                      message:
                                          "confirm password not match with new password",
                                      onPostivePressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      onNegativePressed: () {},
                                      positiveBtnText: 'ok',
                                      negativeBtnText: "",
                                      bgColor: Colors.white,
                                      circularBorderRadius: 15.0);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          dialog);
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
            ],
          )),
    );
  }
}
