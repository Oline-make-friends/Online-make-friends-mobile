import 'package:flutter_making_friends_app_2/models/post_model.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  static final client = http.Client();

  // static Uri buildUrl(String endpoint) {
  //   const String host = "http://192.168.1.16:8000/";
  //   final apiPath = host + endpoint;
  //   return Uri.parse(apiPath);
  // }

  static getAllPost(String endpoint) async {
    var response = await client.get(
      BuildServer.buildUrl(endpoint),
    );
    print("${response.statusCode}: ${response.body}");
    if (response.statusCode == 200) {
      var resultString = response.body;
      return postFromJson(resultString);
    } else {
      return null;
    }
  }
}
