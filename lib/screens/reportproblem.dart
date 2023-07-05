import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/allertdialog.dart';
import 'package:flutter_application_1/constants/pallete.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/help.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Report extends StatefulWidget {
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final _controller = TextEditingController();

  bool _validation = false;

  var url = "https://www.facebook.com/Breast-Cancer-Fighters-101812262601713/";

  var urlT =
      "https://twitter.com/breast_fighters?t=DIo88GjfNXYmn9Xh7zYT5Q&s=08";

  Future proplem() async {
    var res = await http.post(
        Uri.parse('https://backendsda.herokuapp.com/api/v1/help/help'),
        body: <String, String>{'message': _controller.text});

    print(res.body);

    var dialog = CustomAlertDialog(
        title: "Massage Successfuly",
        message: "Thanks for you, and we will fix this problem",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ispatient ? Colors.pink[200] : Colors.blue[200],
        title: Text(
          'Get Help',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Gethelp()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey[800],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: ispatient
              ? AssetImage("assets/photo3.jpg")
              : AssetImage("assets/restd.jpg"),
        )),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 8),
                child: Text('What is your problem?',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 50),
                child: Text('Write Your problem Or Complaint',
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 50, right: 50),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Message',
                    errorText: _validation ? 'please enter your message' : null,
                    prefixIcon: Icon(Icons.message),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                      onPressed: () {
                        proplem();
                        setState(() {
                          if (_controller.text.isEmpty) {
                            _validation = true;
                          } else {
                            _validation = false;
                          }
                        });
                      },
                      child: Center(
                        child: Text(
                          'submit a Report',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      elevation: 5,
                      color: Colors.grey.withOpacity(.85)),
                )),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Text(
                'Follow Us On Social Media',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  onPressed: () async {
                    try {
                      await canLaunch(url)
                          ? await launch(url)
                          : throw 'could not launch url';
                    } catch (e) {}
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    height: 50,
                    width: 50,
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.web_asset,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  height: 50,
                  width: 50,
                  child: FlatButton(
                    onPressed: () async {
                      try {
                        await canLaunch(urlT)
                            ? await launch(urlT)
                            : throw 'could not launch url';
                      } catch (e) {}
                    },
                    child: Image.asset(
                      "assets/twitter.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
