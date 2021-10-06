import 'dart:ui';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthController {
  AppDeterminants appDeterminants = AppDeterminants();

  Future<bool> register(
      {required String city,
      required String area,
      required String phone,
      required String email,
      required String password,
      required String user_name,
      required String re_password, context}) async {
    bool status = false;
    var url =
        Uri.parse('https://rafi.nobalaa.com/CodeSchoolSystem/Auth/Register');
    var response = await http.post(url, body: {
      'role': '3',
      'city': city,
      'area': area,
      'email': email,
      'username': user_name,
      'password': password,
      're_password': re_password,
      'phone': phone,
    });

    if (response.statusCode == 200) {
      status = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red[600],
        content: Text(
          "New account created successfully",
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 4000),
      ));

    } else {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (context != null) {
        var screenHeight = MediaQuery.of(context).size.height;
        var screenWidth = MediaQuery.of(context).size.width;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red[600],
          content: Text(
            jsonResponse['msg'],
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 4000),
        ));
      }
    }
    return status;
  }

  Future<bool> login(String username, String password, {context}) async {
    bool status = false;

    var url = Uri.parse('https://rafi.nobalaa.com/CodeSchoolSystem/Auth/Login');
    var response =
        await http.post(url, body: {'email': username, 'password': password});
    print(response.body);
    if (response.statusCode == 200) {
      status = true;
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // print(response.body);
      Map<String, dynamic> data = jsonResponse['data'];

      appDeterminants.setToken(data['token']);
      appDeterminants.setUserId(data['user_id']);
      appDeterminants.setUsername(data['username']);
      appDeterminants.setEmail(data['email']);
      appDeterminants.setSchoolsIDs(data['school_id']);
      appDeterminants
          .setLoginAt(DateTime.now().millisecondsSinceEpoch.toString());
    } else {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          backgroundColor: Colors.red[600],
          content: Text(jsonResponse['msg']),
          duration: Duration(milliseconds: 4000),
        )));
      }
    }
    return status;
  }
}

