import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/drawer.dart';
import 'package:flutter_application_1/screens/continueas.dart';

class about_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ispatient ? Colors.pink[200] : Colors.blue[300],
          centerTitle: true,
          title: Text(
            'ABOUT US',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            opacity: .8,
            fit: BoxFit.fill,
            image: ispatient
                ? AssetImage("assets/photo3.jpg")
                : AssetImage("assets/aboutd.jpg"),
          )),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Breast cancer is the most common type of cancer in the UK. Most women diagnosed with breast cancer are over the age of 50, but younger women can also get breast cancer. About 1 in 8 women are diagnosed with breast cancer during their lifetimeThere is a good chance of recovery if it isss detected at an early stage.',
                      //overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Our application provides a distinguished service through which we can do a simple test to know the patient condition, and through it, he is directed to a hospital or a private clinic to follow up on his condition and through which pharmacies are available for the appropriate treatment. The application also provides an effective way to perform ray scan and determine if there is a cancer in a particular part Or not, and you can also communicate with doctors efficiently through the application. You can also organize and follow-up your appointment scheduler',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 30),
                  /* SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        aboutus("assets/doc1.png", 'khloud ali',
                            'Flutter devolper'),
                        SizedBox(
                          width: 15,
                        ),
                        aboutus("assets/doc1.png", 'Sara Osama',
                            'Flutter devolper'),
                        SizedBox(
                          width: 15,
                        ),
                        aboutus("assets/doc1.png", 'Shrouk Mohamed',
                            'Fullstack devolper'),
                      ],
                    ),
                  ),*/
                  //SizedBox(),
                  //Divider(),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Drawerr(context),
        ));
  }

  Column aboutus(String image, String name, String dep) {
    return Column(
      children: [
        CircleAvatar(
          child: Image.asset(image),
          radius: 50,
        ),
        Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(dep)
      ],
    );
  }
}
