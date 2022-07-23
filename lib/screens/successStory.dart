import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/allpages.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';
import 'package:flutter_application_1/screens/successinfo.dart';

class sucessStory extends StatefulWidget {
  @override
  State<sucessStory> createState() => _sucessStoryState();
}

class _sucessStoryState extends State<sucessStory> {
  get bottomNavigationBar => null;

  int _selectedIndex = 0;

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

  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: .8,
                    fit: BoxFit.fill,
                    image: AssetImage("assets/fightBackground.jpg"))),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink[200],
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'YOU WILL RECOVER AND TELL YOUR STORY TO OTHER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Baheya()));
                            },
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/baheya.jpg')),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => otherStories()));
                            },
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/fight.jpg')),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
        ],
      ),
    );
  }
}
