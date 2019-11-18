import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WebClient {
  WebClient();
  String urls = "http://192.168.92.27";
  String port = "8000";
  String setPath(String path) {
    return urls + ":" + port + path;
  }

  int statusCode;
  getToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  String getToken = preferences.getString("LastToken");
  return getToken;
}
  Future<dynamic> get(String url, Map<String, String> hdrs) async {
    final http.Response response = await http.Client().get(
      url,
      headers: hdrs,
    );
    this.statusCode = response.statusCode;
    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }
        Fluttertoast.showToast(
        msg: "Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return json.decode(response.body);
  }

  Future<dynamic> post(String url, dynamic data, Map<String, String> hdrs) async {
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
        Fluttertoast.showToast(
        msg: "Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
          Fluttertoast.showToast(
        msg: "Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
      return jsonResponse;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
  }
}
