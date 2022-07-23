import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pharmcy/drgmodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:io';

class Display extends StatefulWidget {
  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late Future<DrugDataModel?> allDrugs;

  @override
  void initState() {
    super.initState();
    allDrugs = getAllDrugs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Center(
            child: Row(
              children: [
                Text(
                  'Treats',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Subscribtion',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                //showSearch(context: context, delegate: SearchDrug());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body: FutureBuilder<DrugDataModel?>(
          future: allDrugs,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.alldrugs?.length,
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
                                            .data!.alldrugs![index].image
                                            .toString()))),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 3,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          snapshot.data!.alldrugs![index].name
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.monetization_on),
                                          Text(
                                            'price:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              snapshot
                                                  .data!.alldrugs![index].price
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => description(
                                                              snapshot
                                                                  .data!
                                                                  .alldrugs![
                                                                      index]
                                                                  .image
                                                                  .toString(),
                                                              snapshot
                                                                  .data!
                                                                  .alldrugs![
                                                                      index]
                                                                  .name
                                                                  .toString(),
                                                              snapshot
                                                                  .data!
                                                                  .alldrugs![
                                                                      index]
                                                                  .about
                                                                  .toString(),
                                                              snapshot
                                                                  .data!
                                                                  .alldrugs![
                                                                      index]
                                                                  .price
                                                                  .toString(),
                                                              snapshot
                                                                  .data!
                                                                  .alldrugs![
                                                                      index]
                                                                  .url
                                                                  .toString())));
                                                },
                                                child: Text(
                                                  'About this product',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                                color: Colors.pink[200]),
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
              return const CircularProgressIndicator();
            }
          },
        ));
  }

  Future<DrugDataModel?> getAllDrugs() async {
    try {
      var response = await http.get(
        Uri.parse('https://procanecer.herokuapp.com/api/v1/drugs/getAllDrugs'),
        headers: {
          'Accept': 'application/json',
        },
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap['status'] == "Success") {
        final data = DrugDataModel.fromJson(jsonDecode(response.body));
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

  Container description(
      String url, String title, String descreb, String pri, String link) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
      ),
      child: ListView(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image(
            image: new NetworkImage(url),
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.black
                      //fontWeight: FontWeight.bold
                      ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$pri L.E',
                  style: TextStyle(fontSize: 15, color: Colors.pink),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 15),
          //child: Align(
          //alignment: Alignment.topLeft,
          child: Column(
            children: [
              Text(
                'About The Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                descreb,
                softWrap: true,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  backgroundColor: null,
                ),
              )
            ],
          ),
        ),
        //),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Text(
            'Find this product in pharmacy',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink[300]),
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTextButton('pharmacy', link),
            buildTextButton('Cancel', '')
          ],
        ),
      ]),
    );
  }

  TextButton buildTextButton(String title, String link) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (title == 'pharmacy') {
            launch(link);
          } else {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return Display();
            }));
          }
        });
      },
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor:
              title == 'pharmacy' ? Colors.pink[100] : Colors.grey),
      child: Row(
        children: [
          Text(
            title,
          )
        ],
      ),
    );
  }
}
