
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:splash_tokenauth/common/functions/getToken.dart';

import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';


Future getDataJango(BuildContext context,int i) async {
  final url = "http://192.168.92.12:8000/core_app/hello/";

  var token;

  await getToken().then((result) {
    token = result;
  });

  http.Response response;
  if(i==0)
    {
        response = await http.Client().get(
      url,
      
      headers: {'Authorization': "Bearer $token"},
    );
    }
  else
  {
     response = await http.Client().get(
    url,

    );
  }

  

  if (response.statusCode == 200) {
     showDialogSingleButton(context, "Data Retrieved Succesfully", response.body, "OK");
  
    return null;
  } else {
    showDialogSingleButton(context, "Error", response.body, "OK");
    return null;
  }
}