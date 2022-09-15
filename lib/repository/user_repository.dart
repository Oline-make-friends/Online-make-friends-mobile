import 'package:http/http.dart' as http;

class UserRepository {
  static final client = http.Client();

  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(
      buildUrl(endpoint),
      body: body,
      headers: {"Content-type": "application/json"},
    );
    print("${response.statusCode}: ${response.body}");
    return response.body;
  }

  static Uri buildUrl(String endpoint) {
    const String host = "http://192.168.1.19:8000/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
}
