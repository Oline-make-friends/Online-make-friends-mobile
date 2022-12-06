import 'dart:convert';

import 'package:flutter_making_friends_app_2/models/comment_model.dart';
import 'package:http/http.dart' as http;

import 'build_server.dart';

class CommentRepository {
  static final client = http.Client();
  static addComment(String endpoint, String content, String userId) async {
    var response = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "content": content,
        "user_id": userId,
      }),
      headers: {"Content-type": "application/json"},
    );
    print('${response.statusCode}: ${response.body} ');
    return commentFromJson(response.body);
  }
}
