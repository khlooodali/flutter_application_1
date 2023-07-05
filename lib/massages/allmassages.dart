import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/massages/massagemodel.dart';

import 'package:flutter_application_1/theme/extention.dart';
import 'package:flutter_application_1/theme/light_color.dart';
import 'package:flutter_application_1/theme/text_styles.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class massages extends StatefulWidget {
  @override
  State<massages> createState() => _massagesState();
}

class _massagesState extends State<massages> {
  late Future<Massagemodel?> data;

  @override
  void initState() {
    super.initState();
    data = getallmsgs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], //Theme.of(context).backgroundColor,
      body: FutureBuilder<Massagemodel?>(
          future: getallmsgs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            leading: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/oponion.png',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            title: Text(
                                snapshot.data!.data![index].name.toString(),
                                style: TextStyles.title),
                            subtitle: Text(
                              snapshot.data!.data![index].message.toString(),
                              style: TextStyles.bodySm.subTitleColor.bold,
                            ),
                            /*  trailing: Text(
                              snapshot.data!.data![index].email.toString(),
                            ), */
                          ),
                        ));
                  });
            } else {
              return Center(child: const CircularProgressIndicator());
            }
          }),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Future<Massagemodel?> getallmsgs() async {
    try {
      var response = await http.get(
        Uri.parse('https://backendsda.herokuapp.com/api/v1/contact/contactus'),
        headers: {
          'Accept': 'application/json',
        },
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = Massagemodel.fromJson(jsonDecode(response.body));
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
}
