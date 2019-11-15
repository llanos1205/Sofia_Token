
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_tokenauth/common/apifunctions/WebClient.dart';

import 'package:splash_tokenauth/common/functions/getToken.dart';

import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';
import 'WebClient.dart';
//https://stackoverflow.com/questions/49930180/flutter-render-widget-after-async-call

Future<List<Widget>> getItems(BuildContext context) async {
  WebClient client = new WebClient();
  String token;
  await getToken().then((result) {
    token = result;
  });
  final x = await client.get(
      client.setPath('/core_app/Items/'), {'Authorization': "Bearer $token"});
  List<Widget> list = new List<Widget>();
  for (var item in x) {
    list.add(
      InkWell(
        onTap: () =>
            Navigator.of(context).pushReplacementNamed('/DetailScreen'),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            child: Column(
              children: <Widget>[
                Image.network(item['imagen']),
                Text(item["nombre"]),
              ],
            )),
      ),
    );
  }
  return list;
}

Future getDataJango(BuildContext context, int i) async {
  final url = "http://192.168.92.12:8000/core_app/hello/";

  var token;

  await getToken().then((result) {
    token = result;
  });

  http.Response response;
  if (i == 0) {
    response = await http.Client().get(
      url,
      headers: {'Authorization': "Bearer $token"},
    );
  } else {
    response = await http.Client().get(
      url,
    );
  }

  if (response.statusCode == 200) {
    showDialogSingleButton(
        context, "Data Retrieved Succesfully", response.body, "OK");

    return null;
  } else {
    showDialogSingleButton(context, "Error", response.body, "OK");
    return null;
  }
}
