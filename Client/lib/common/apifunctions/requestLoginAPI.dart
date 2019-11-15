import 'dart:async';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash_tokenauth/common/functions/saveCurrentLogin.dart';
import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';
import 'dart:convert';
import 'WebClient.dart';
import 'package:splash_tokenauth/model/json/loginModel.dart';
import 'Globals.dart';
Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {
  
  
  Map<String, String> body = {
    'username': username,
    'password': password,
  };
  WebClient response= new WebClient();
  // final http.Response response = await http.Client().post(
  //   url,
  //   body: jsonEncode(body),
  //   headers: {
  //       'Content-Type': 'application/json',
  //     },
  // );
  final jsonbody=await  response.post(response.setPath('/api/token/'), jsonEncode(body), {
    'Content-Type': 'application/json'
  });

  if (response.statusCode == 200) {
    final responseJson = json.decode(jsonbody);
    showDialogSingleButton(context, "Log in succesfull", jsonbody, "OK");
  
    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(jsonbody);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}

