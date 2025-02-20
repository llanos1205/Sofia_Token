import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WebClient {
  WebClient();
  String url = "http://10.255.171.95";
  String port = "8000";
  String setPath(String path) {
    return url + ":" + port + path;
  }

  int statusCode;
  Future<dynamic> get(String url, Map<String, String> hdrs) async {
    final http.Response response = await http.Client().get(
      url,
      headers: hdrs,
    );
    this.statusCode = response.statusCode;
    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }

    return json.decode(response.body);
  }

  Future<dynamic> post(
      String url, dynamic data, Map<String, String> hdrs) async {
    final http.Response response = await http.Client().post(
      url,
      body: data,
      headers: hdrs,
    );
    this.statusCode = response.statusCode;
    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }

    try {
      return response.body;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
  }

  Future<dynamic> put(
      String url, dynamic data, Map<String, String> hdrs) async {
    final http.Response response = await http.Client().put(
      url,
      body: data,
      headers: hdrs,
    );
    this.statusCode = response.statusCode;
    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }

    try {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
  }
}
