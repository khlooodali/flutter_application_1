import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';

int _currentPage = 0;
Timer? _timer;
PageController _pageController = PageController(
  initialPage: 0,
);

class elements {
  final String url;
  elements(this.url);
}

class pageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _pageview();
  }
}

class _pageview extends State<pageView> {
  List<elements> mydata = [
    elements("assets/splash2.jpg"),
    elements("assets/photo2.jpg"),
    elements("assets/s2.gif"),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 3000),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //theme: ThemeData(
// brightness: Brightness.light,
//),
//darkTheme: ThemeData(brightness: Brightness.dark),
//themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(
          children: [
            PageView(
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
            Center(
              child: Align(
                alignment: const Alignment(0, 0.7),
                child: indecator(),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.99),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                      //selectScreen(context);
                    },
                    child: const Text('Get Started',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}

class indecator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 170),
      child: Row(
        children: [
          buildindecator(_currentPage == 0 ? Colors.pinkAccent : Colors.grey),
          const SizedBox(
            width: 5,
          ),
          buildindecator(_currentPage == 1 ? Colors.pinkAccent : Colors.grey),
          const SizedBox(width: 5),
          buildindecator(_currentPage == 2 ? Colors.pinkAccent : Colors.grey),
          const SizedBox(
            width: 5,
          ),
          //buildindecator(_currentPage == 3 ? Colors.pinkAccent : Colors.grey),
          //const SizedBox(
          // width: 5,
          //),
        ],
      ),
    );
  }

  Container buildindecator(Color color) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
