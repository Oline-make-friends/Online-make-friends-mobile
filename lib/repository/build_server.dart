class BuildServer {
  static Uri buildUrl(String endpoint) {
    const String host = "http://192.168.1.16:8000/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
}
