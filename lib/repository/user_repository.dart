import 'dart:convert';

import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static final client = http.Client();

  static Future<String> postLogin(var body, String endpoint) async {
    var response = await client.post(
      BuildServer.buildUrl(endpoint),
      body: body,
      headers: {"Content-type": "application/json"},
    );
    // print("${response.statusCode}: ${response.body}");
    return response.body;
  }

  static getAllUser(String endpoint) async {
    var response = await client.get(
      BuildServer.buildUrl(endpoint),
    );
    // print("${response.statusCode}: ${response.body}");
    if (response.statusCode == 200) {
      var resultString = response.body;
      return userFromJson(resultString);
    } else {
      return null;
    }
  }

  // static Uri buildUrl(String endpoint) {
  //   const String host = "http://192.168.1.16:8000/";
  //   final apiPath = host + endpoint;
  //   return Uri.parse(apiPath);
  // }
}
