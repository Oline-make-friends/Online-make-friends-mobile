import 'dart:convert';

import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:http/http.dart' as http;

import 'build_server.dart';

class EventRepository {
  static final client = http.Client();

  static getAllEvent(String endpoint) async {
    var response = await client.get(
      BuildServer.buildUrl(endpoint),
    );
    if (response.statusCode == 200) {
      var resultString = response.body;
      return eventFromJson(resultString);
    } else {
      return null;
    }
  }

  static joinEvent(String endpoint, String eventId, String userId) async {
    var response = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "eventId": eventId,
        "userId": userId,
      }),
      headers: {"Content-type": "application/json"},
    );
    // print('${response.statusCode}: ${response.body}');
    return response.body;
  }

  static leaveEvent(String endpoint, String eventId, String userId) async {
    var response = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "eventId": eventId,
        "userId": userId,
      }),
      headers: {"Content-type": "application/json"},
    );
    // print('${response.statusCode}: ${response.body}');
    return response.body;
  }

  static getUserEvent(String endpoint, String username) async {
    var response = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "username": username,
      }),
      headers: {"Content-type": "application/json"},
    );
    // print('${response.statusCode}: ${response.body}');
    return response.body;
  }
}
