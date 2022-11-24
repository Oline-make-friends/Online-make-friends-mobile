import 'dart:convert';

import 'package:flutter_making_friends_app_2/models/group_model.dart';
import 'package:http/http.dart' as http;

import 'build_server.dart';

class GroupRepository {
  static final client = http.Client();

  static getAllGroup(String endpoint) async {
    var response = await client.get(
      BuildServer.buildUrl(endpoint),
    );
    // print("${response.statusCode}: ${response.body}");
    if (response.statusCode == 200) {
      var resultString = response.body;
      // print("getAllGroup: $resultString");
      return groupFromJson(resultString);
    } else {
      return null;
    }
  }

  static joinGroup(String endpoint, String groupId, String userId) async {
    var response = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "_id": groupId,
        "idUser": userId,
      }),
      headers: {"Content-type": "application/json"},
    );
    // print('${response.statusCode}: ${response.body}');
    return response.body;
  }
}
