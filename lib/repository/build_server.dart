class BuildServer {
  static Uri buildUrl(String endpoint) {
    const String host = "https://social-media-api-moongo.herokuapp.com/";
    // const String host = "http://192.168.1.21:8000/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
}
