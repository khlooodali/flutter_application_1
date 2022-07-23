import 'package:flutter/material.dart';
import 'package:flutter_application_1/doctors/doctormodel.dart';
import 'package:flutter_application_1/theme/extention.dart';
import 'package:flutter_application_1/theme/light_color.dart';
import 'package:flutter_application_1/theme/text_styles.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageScreen> {
  late Future<DoctorModel?> allDoc;
  bool isfavorite = true;
  @override
  void initState() {
    super.initState();
    allDoc = getalldoc();
  }

  /* Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], //Theme.of(context).backgroundColor,
      body: FutureBuilder<DoctorModel?>(
          future: getalldoc(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.allDoc?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            color: LightColor.grey.withOpacity(.2),
                          ),
                          BoxShadow(
                            offset: Offset(-3, 0),
                            blurRadius: 15,
                            color: LightColor.grey.withOpacity(.1),
                          )
                        ],
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                //color: randomColor(),
                              ),
                              child: Image.network(
                                snapshot.data!.allDoc![index].avatar!.url
                                    .toString(),
                                height: 50,
                                width: 50,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          title: Text(
                              snapshot.data!.allDoc![index].name.toString(),
                              style: TextStyles.title.bold),
                          subtitle: Text(
                            snapshot.data!.allDoc![index].specialize.toString(),
                            style: TextStyles.bodySm.subTitleColor.bold,
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ).ripple(
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => aboutdoctor(
                                  snapshot.data!.allDoc![index].avatar!.url
                                      .toString(),
                                  snapshot.data!.allDoc![index].specialize
                                      .toString(),
                                  snapshot.data!.allDoc![index].about
                                      .toString(),
                                  snapshot.data!.allDoc![index].name.toString(),
                                  snapshot.data!.allDoc![index].phone
                                      .toString(),
                                ),
                              ));
                        },
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }

  Future<DoctorModel?> getalldoc() async {
    try {
      var response = await http.get(
        Uri.parse('https://procanecer.herokuapp.com/api/v1/doctor/alldoctor'),
        headers: {
          'Accept': 'application/json',
        },
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap['status'] == "Success") {
        final data = DoctorModel.fromJson(jsonDecode(response.body));
        // Fluttertoast.showToast(
        //     msg: responseMap["msg"],
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Constants.primaryAppColor,
        //     textColor: Constants.white,
        //     fontSize: 16.0);
        return data;
      } else {
        print("error");
        // Fluttertoast.showToast(
        //     msg: responseMap["msg"],
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Constants.primaryAppColor,
        //     textColor: Constants.white,
        //     fontSize: 16.0);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
      // ignore: nullable_type_in_catch_clause
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget aboutdoctor(
      String url, String specialize, String about, String name, String phone) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    return Scaffold(
      backgroundColor: LightColor.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(url),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: AppTheme.fullHeight(context) * .5,
                  padding: EdgeInsets.only(
                    left: 19,
                    right: 19,
                    top: 16,
                  ), //symmetric(horizontal: 19, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'DR.$name',
                                style: titleStyle,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: IconButton(
                                  icon: Icon(
                                    isfavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 30,
                                    color: isfavorite
                                        ? Colors.red
                                        : LightColor.grey,
                                  ),
                                  onPressed: () {
                                    isfavorite = !isfavorite;
                                  },
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          subtitle: Text(
                            specialize,
                            style: TextStyles.bodySm.subTitleColor.bold,
                          ),
                        ),
                        Divider(
                          thickness: .3,
                          color: LightColor.grey,
                        ),
                        Text("About", style: titleStyle).vP16,
                        Text(
                          about,
                          style: TextStyles.body.subTitleColor,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: double.infinity,
                            color: Colors.grey,
                            child: ExpansionTile(
                              leading: Icon(
                                Icons.whatsapp,
                                size: 25,
                                color: Colors.green[300],
                              ),
                              title: Center(
                                child: Text(
                                  'Contact Via WhatsApp',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              children: [
                                ListTile(
                                  title: Center(child: Text(phone)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            _appbar(),
          ],
        ),
      ),
    );
  }
}
