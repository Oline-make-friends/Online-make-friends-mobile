import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:http/http.dart' as http;

import 'build_server.dart';

class CourseRepository {
  static final client = http.Client();

  static getAllCourse(String endpoint) async {
    var response = await client.get(
      BuildServer.buildUrl(endpoint),
    );
    // print("${response.statusCode}: ${response.body}");
    if (response.statusCode == 200) {
      var resultString = response.body;
      // print("getAllGroup: $resultString");
      return courseFromJson(resultString);
    } else {
      return null;
    }
  }
}
