import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/doctors/doclogin.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';

bool ispatient = false;

class Continue extends StatefulWidget {
  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photo4.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Continue As ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    child: Text(
                      'Doctor',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () {
                      ispatient = false;
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return doclogin();
                      }));
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    child: Text(
                      'Patient',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () {
                      ispatient = true;

                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return LoginSignupScreen();
                      }));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
