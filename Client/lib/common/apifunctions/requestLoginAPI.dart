import 'dart:async';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash_tokenauth/common/functions/saveCurrentLogin.dart';
import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';
import 'dart:convert';

import 'package:splash_tokenauth/model/json/loginModel.dart';

Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {
  final url = "http://192.168.92.30:8000/api/token/";

  Map<String, String> body = {
    'username': username,
    'password': password,
  };

  final http.Response response = await http.Client().post(
    url,
    body: jsonEncode(body),
    headers: {
        'Content-Type': 'application/json',
      },
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);
    showDialogSingleButton(context, "Log in succesfull", response.body, "OK");
  
    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}

