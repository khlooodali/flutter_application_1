import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/X-Ray/raymodel.dart';
import 'package:flutter_application_1/X-Ray/search.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Rays extends StatefulWidget {
  @override
  State<Rays> createState() => _RaysState();
}

class _RaysState extends State<Rays> {
  late Future<RayModel?> rays;

  @override
  void initState() {
    super.initState();
    rays = getallRays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Center(
          child: Text(
            '~BEST X-RAY CENTERs IN EGYPT~',
            style: TextStyle(
                // backgroundColor: Colors.pink[200],
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: Icon(Icons.search_sharp),
          )
        ],
      ),
      body: FutureBuilder<RayModel?>(
        future: getallRays(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.rays?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(snapshot
                                        .data!.rays![index].photo
                                        .toString())),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 3,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        snapshot.data!.rays![index].name
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(children: [
                                      Text(
                                        'Governement:',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 76, 159, 228),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          snapshot.data!.rays![index].government
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined),
                                        Text(
                                          'City:',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 76, 159, 228),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data!.rays![index].city
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined),
                                        Text(
                                          'Location:',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 76, 159, 228),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data!.rays![index].location
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone),
                                        Text(
                                          'Phone:',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 76, 159, 228),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data!.rays![index].phone
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month),
                                        Text(
                                          'Appoinement:',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 76, 159, 228),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot
                                                .data!.rays![index].appoinment
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.web_asset),
                                        Text(
                                          'Website:',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 76, 159, 228),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: InkWell(
                                              child: Text(
                                                snapshot
                                                    .data!.rays![index].website
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              onTap: () => launch(snapshot
                                                  .data!.rays![index].url
                                                  .toString())),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: FlatButton(
                                            onPressed: () => launch(snapshot
                                                .data!.rays![index].url
                                                .toString()),
                                            child: Text(
                                              'Follow location',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            color: Color.fromARGB(
                                                255, 76, 159, 228),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]))
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }

  Future<RayModel?> getallRays() async {
    try {
      var response = await http.get(
        Uri.parse('https://backendsda.herokuapp.com/api/v1/rays/getrays'),
        headers: {
          'Accept': 'application/json',
        },
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = RayModel.fromJson(jsonDecode(response.body));
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
