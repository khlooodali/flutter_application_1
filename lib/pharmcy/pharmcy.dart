import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pharmcy/displayalldrugs.dart';

class Pharmcy extends StatefulWidget {
  @override
  State<Pharmcy> createState() => _PharmcyState();
}

class _PharmcyState extends State<Pharmcy> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: ExactAssetImage("assets/pharmacy1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          /* Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (_) {
                            return Home();
                          })); */
                        },
                        icon: Icon(Icons.arrow_back))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choose',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Teats Online',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Display()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
