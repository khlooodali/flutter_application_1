import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/X-Ray/displayrays.dart';
import 'package:flutter_application_1/doctors/splach.dart';
import 'package:flutter_application_1/massages/allmassages.dart';
import 'package:flutter_application_1/pharmcy/pharmcy.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/instructions.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';
import 'package:flutter_application_1/screens/successStory.dart';
import 'package:flutter_application_1/screens/testpage.dart';

import 'scanpage.dart';

import 'allpages.dart';

int _currentPage = 0;
Timer? _timer;
PageController _pageController = PageController(
  initialPage: 0,
);

bool isx_ray = false;
bool isdoctor = false;
bool isappoinment = false;
bool ispharmcy = false;
Color? cc = Colors.grey[200];

class elements {
  final String url;
  elements(this.url);
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<elements> mydata = [
    elements("assets/img4.jpg"),
    elements("assets/img1.jpeg"),
    elements("assets/img2.jpeg"),
    elements("assets/img3.jpg"),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  get bottomNavigationBar => null;
  int _selectedIndex = 0;

  get children => null;

  void whenpressed(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return LoginSignupScreen();
        }));
      } else if (index == 0) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return Home();
        }));
      } else if (index == 2) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return pages();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                children: mydata
                    .map(
                      (item) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(item.url),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 220, left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              margin: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 130,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/x-ray.jpg',
                            ),
                            radius: 30,
                          ),
                          TextButton(
                            child: Text(
                              "Scan",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 12),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scan()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/pharmcyd.jpg',
                            ),
                            radius: 30,
                          ),
                          TextButton(
                            child: Text(
                              "Pharmacy",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pharmcy()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/food1.jpg',
                            ),
                            radius: 30,
                          ),
                          TextButton(
                            child: Text(
                              "Instructions",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => instructions()));
                            },
                          ),
                        ],
                      ),
                    ),
                    /* Container(
                      width: 130,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/appoinment2.jpg',
                            ),
                            radius: 30,
                          ),
                          TextButton(
                            child: Text(
                              "Appoinment",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => appoinement()));
                            },
                          ),
                        ],
                      ),
                    ), */
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 320, left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              margin: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 130,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/x-ray1.jpg',
                            ),
                            radius: 30,
                          ),
                          TextButton(
                            child: Text(
                              "X-ray centers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Rays()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/logo.jpg',
                            ),
                            radius: 30,
                          ),
                          TextButton(
                            child: Text(
                              "Success Stories",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => sucessStory()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/doctor_face.jpg',
                            ),
                            radius: 30,
                          ),
                          TextButton(
                            child: Text(
                              "Doctors",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SplashScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/oponion1.jpg',
                            ),
                            radius: 30,
                          ),
                          TextButton(
                            child: Text(
                              "Oponions",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => massages()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment(0, 0.7),
              child: Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/health2.jpg"),
                          fit: BoxFit.fill)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 150, top: 20),
                          child: Text(
                              'You can check your health using a preliminary test'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 230),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) {
                                    return Test();
                                  }));
                                });
                              },
                              child: Text('Start'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.99),
            child: BottomNavigationBar(
              backgroundColor: Colors.grey[200],
              selectedIconTheme: IconThemeData(
                  color: ispatient ? Colors.pink[200] : Colors.blue[200]),
              selectedItemColor:
                  ispatient ? Colors.pink[200] : Colors.blue[200],
              unselectedIconTheme: IconThemeData(
                color: Colors.grey[600],
              ),
              unselectedItemColor: Colors.grey[600],
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.login),
                  label: 'Login',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notes),
                  label: 'Pages',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: whenpressed,
            ),
          )
        ]),
      )),
    );
    throw UnimplementedError();
  }
}
