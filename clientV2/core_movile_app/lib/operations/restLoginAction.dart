import 'dart:async';
import 'package:core_movile_app/operations/saveCurrentLogin.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:core_movile_app/services/webClientService.dart';
Future<bool> requestLoginAPI(BuildContext context, String username, String password) async {
  
  
  Map<String, String> body = {
    'username': username,
    'password': password,
  };
  WebClient response= new WebClient();
  final jsonbody=await  response.post(response.setPath('/api/token/'), jsonEncode(body), {
    'Content-Type': 'application/json'
  });

  if (response.statusCode == 200) {
    final responseJson = json.decode(jsonbody);
    
    await saveCurrentLogin(responseJson);
    //Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return true;
  } else {
    final responseJson = json.decode(jsonbody);
    await saveCurrentLogin(responseJson);
    return false;
  }
}
