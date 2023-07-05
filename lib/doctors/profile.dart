import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/doctors/doctormodel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final icon = CupertinoIcons.moon_stars;
  bool isdark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], //Theme.of(context).backgroundColor,
      body: FutureBuilder<DoctorModel?>(
          future: getProfileInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.allDoc?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                ClipOval(
                                  child: Container(
                                      width: 200,
                                      height: 200,
                                      child: Image.network(
                                        snapshot
                                            .data!.allDoc![index].avatar!.url
                                            .toString(),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          buildName(
                              snapshot.data!.allDoc![index].name.toString(),
                              snapshot.data!.allDoc![index].email.toString()),
                          const SizedBox(height: 24),
                          buildAddress(
                              snapshot.data!.allDoc![index].address.toString()),
                          const SizedBox(height: 24),
                          builddep(snapshot.data!.allDoc![index].specialize
                              .toString()),
                          const SizedBox(height: 24),
                          buildphone(
                              snapshot.data!.allDoc![index].phone.toString()),
                          const SizedBox(height: 24),
                          price(snapshot.data!.allDoc![index].price.toString()),
                          const SizedBox(height: 24),
                          buildAbout(
                              snapshot.data!.allDoc![index].about.toString()),
                        ],
                      ),
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget buildName(String name, String email) => Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: isdark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            //user.email,
            email,
            style: TextStyle(
              color: isdark ? Colors.grey : Colors.black,
            ),
          )
        ],
      );

  Widget buildphone(String phone) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              phone,
              style: TextStyle(
                color: isdark ? Colors.grey : Colors.black,
              ),
            )
          ],
        ),
      );

  Widget buildAbout(String about) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              //user.about,
              about,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      );

  Widget buildAddress(String address) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              address,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      );

  Widget builddep(String special) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Specialization',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              special,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      );

  Widget price(String price) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price of Detection',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      );
}

Future<DoctorModel?> getProfileInfo() async {
  try {
    var response = await http.get(
      Uri.parse('https://procanecer.herokuapp.com/api/v1/doctor/alldoctor'),
      headers: {'Accept': 'application/json'},
    );
    Map<String, dynamic> responseMap = json.decode(response.body);
    print(responseMap.toString());
    if (response.statusCode == 200) {
      final data = DoctorModel.fromJson(jsonDecode(response.body));
      /* Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0); */
      return data;
    } else {
      /* Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0); */
    }
  } on TimeoutException catch (e) {
    print('Timeout Error: $e');
  } on SocketException catch (e) {
    print('Socket Error: $e');
  } on Error catch (e) {
    print('General Error: $e');
  }
}
