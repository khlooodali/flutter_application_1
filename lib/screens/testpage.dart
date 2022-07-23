import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/drawer.dart';
import 'package:flutter_application_1/screens/guid.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';
import 'package:flutter_application_1/screens/reconer.dart';

var n = 0;
var score = 0;

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.pink[200],
                title: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(0.8),
                    child: Column(children: [
                      Center(
                        child: Text('Follow the video ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.8),
                          child: Text(
                              'to learn how to self-discover the disease at home',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              )),
                        ),
                      )
                    ]),
                  ),
                )),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/photo4.jpeg"),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 40),
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/video.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      color: Colors.pink[300],
                      child: Text(
                        "Go To Test Page",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Test_page(),
                          ),
                        );
                      },
                    )
                  ],
                )),
            drawer: Drawer(
              child: Drawerr(context),
            )));
  }
}

class Test_page extends StatefulWidget {
  @override
  _Test_pageState createState() => _Test_pageState();
}

class _Test_pageState extends State<Test_page> {
  List que = [
    questions(
        " هل لاحظتي ظهور كتل أو عقد صلبة غير مؤلمة في الثدي أو تحت الإبط؟ ",
        true),
    questions("هل لاحظتي ظهور تغيرات في مظهر الثدي او الحلمه؟", true),
    questions("هل لاحظتي انتفاخات اوتورمات في الثدي؟.", true),
    questions("هل لاحظتي خروج اي إفرازات من الثديين؟", true),
    questions(
        "هل لاحظتي تغير في حجم وشكل الثدي أو تجعد في الجلد المحيط بيه؟", true),
    questions("هل لاحظتي انعكاس في حلمة الثدي؟", true),
    questions(
        "هل لاحظتي حكةاو احمرار أو تقرحات قشرية أو طفح جلدي حول الثدي؟", true),
    questions("هل لاحظتي وجود ثقوب او نتوء في جلد الثدي؟", true),
    questions("هل لاحظتي عدم تناسق حجم الثديين؟", true),
    questions("هل لاحظتي وجود اي اورده زائده في منطقه الثدي؟", true),
  ];
  void check(bool choice, BuildContext ctx) {
    if (choice == que[n].ans) {
      score = score + 1;
      final snackbar = SnackBar(
        content: Text('لا تخافي ؛ انا اتعلم منكي الصبر و التفاؤل والقوه :)'),
        duration: Duration(milliseconds: 1000),
        backgroundColor: Colors.green,
      );
      // ignore: deprecated_member_use
      Scaffold.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text('دمتي فصحه دائما :)'),
        duration: Duration(milliseconds: 1000),
        backgroundColor: Colors.red,
      );
      // ignore: deprecated_member_use
      Scaffold.of(ctx).showSnackBar(snackbar);
    }

    setState(() {
      if (n < que.length - 1) {
        n = n + 1;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Guid()),
        );
      }
      if (score == 0 && n == 9) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Recover()),
        );
      }

      /*else {
        final snackbar = SnackBar(
          content: Text('Test Completed : $score/10  '),
          //   if (score > 2 && score < 11) {
          //   final snackbar = SnackBar(
          //     content:
          //         Text('You must get ray and go to doctor as soon as possible'),
          //     duration: Duration(seconds: 3),
          //     backgroundColor: Colors.lightBlueAccent,
          //   );
          // } else {
          //   final snackbar = SnackBar(
          //     content: Text(
          //         'Don"t worry,but you should follow your condition constantly'),
          //     duration: Duration(seconds: 3),
          //     backgroundColor: Colors.lightBlueAccent,
          //   );
          // }
          duration: Duration(seconds: 3),
          backgroundColor: Colors.lightBlueAccent,
        );
        // ignore: deprecated_member_use
        Scaffold.of(ctx).showSnackBar(snackbar);
        reset();
      }*/
    });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD0D5D6),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.pink[200],
        title: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Small Test For You ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                " Please Follow Structure",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                " Answer Following Question (Yes or No)",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ],
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/photo4.jpeg"),
        )),
        child: SingleChildScrollView(
          child: Builder(
            builder: (ctx) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 105,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(50)),
                      border: Border.all(color: Colors.pink, width: 5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        que[n].que,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                      color: Colors.greenAccent.shade700,
                      onPressed: () => check(true, ctx),
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () => check(false, ctx),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(Icons.close),
                      color: Colors.red.shade700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Symptoms: $score/10",
                        style: TextStyle(
                            color: Colors.blue.shade800,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      InkWell(
                          onTap: () => reset(),
                          child: Text(
                            "Reset",
                            style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          )),
                    ],
                  ),
                ),
                Column(children: [
                  SizedBox(
                    height: 35,
                  ),
                  /*Text(
                    'If Symptoms>2 :You must get ray and go to doctor as soon as possible and you can scan ray.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),*/
                  /*  FlatButton(
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Scan()),
                        );*/
                      },
                      child: Icon(
                        Icons.qr_code_scanner_outlined,
                        size: 50,
                        color: Colors.blue.shade700,
                      ))*/
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class questions {
  final String que;
  final bool ans;

  questions(this.que, this.ans);
}
