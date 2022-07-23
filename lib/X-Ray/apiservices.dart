import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/X-Ray/rayModel.dart';
import 'package:http/http.dart' as http;

class FetchXrayList {
  var data = [];
  List<RayModel> results = [];
  String urlList = 'https://procanecer.herokuapp.com/api/v1/rays/get_one_ray/';

  /*Future<List<Userlist>> getxrayList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
      
        data = json.decode(response.body);
        results = data.map((e) => Userlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  } */

  Future<RayModel?> getSomeRays({String? query}) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://procanecer.herokuapp.com/api/v1/rays/get_one_ray/$query'),
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
        print(responseMap["msg"]);
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
