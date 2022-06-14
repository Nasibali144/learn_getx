import 'dart:convert';

import 'package:http/http.dart' as http;

import 'log_service.dart';

class NetworkService {
  static bool isTester = true;

  static const String SERVER_DEVELOPMENT =
      "jsonplaceholder.typicode.com";
  static const String SERVER_PRODUCTION = "jsonplaceholder.typicode.com";
  static const String API_POST = "/posts";
  static const String API_POST_CREATE = "/posts";
  static const String API_POST_DELETE = "/posts/"; //ID
  static const String API_POST_UPDATE = "/posts/"; //ID

  static String getServer() {
    if (isTester) {
      return SERVER_DEVELOPMENT;
    }
    return SERVER_PRODUCTION;
  }

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.http(getServer(), api, params);
    http.Response? response = await http.get(uri);
    LogService.i(response.statusCode.toString());

    if (response.statusCode != 200) {
      return null;
    }

    return response.body;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.http(getServer(), api);
    http.Response? response = await http.post(uri, body: params);
    LogService.i(response.body);

    if (response.statusCode != 200 || response.statusCode != 201) {
      return null;
    }

    return response.body;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(getServer(), api);
    http.Response? response = await http.delete(uri, body: params);
    LogService.i(response.statusCode.toString());

    if (response.statusCode != 200 || response.statusCode != 201) {
      return null;
    }

    return response.body;
  }

  static Future<String?> UPDATE(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.http(getServer(), api);
    http.Response? response = await http.put(uri, body: jsonEncode(params));
    LogService.i(response.body);

    return response.body;
  }
}