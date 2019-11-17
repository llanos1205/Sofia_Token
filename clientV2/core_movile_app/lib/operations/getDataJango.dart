
import 'package:core_movile_app/models/itemModel.dart';
import 'package:core_movile_app/ui/itemholder.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:core_movile_app/services/webClientService.dart';

Future<List<Widget>> getItems(BuildContext context) async {
  WebClient client = new WebClient();
  String token;
  await client.getToken().then((result) {
    token = result;
  });
  final x = await client.get(
      client.setPath('/core_app/Items/'), {'Authorization': "Bearer $token"});
  List<Widget> list = new List<Widget>();
  for (var item in x) {
    list.add(
        ItemHolder(ItemModel.toJson(item))
       );
  }
  return list;
}

// Future getDataJango(BuildContext context, int i) async {
//   final url = "http://192.168.92.12:8000/core_app/hello/";

//   var token;

//   await client.getToken().then((result) {
//     token = result;
//   });

//   http.Response response;
//   if (i == 0) {
//     response = await http.Client().get(
//       url,
//       headers: {'Authorization': "Bearer $token"},
//     );
//   } else {
//     response = await http.Client().get(
//       url,
//     );
//   }

//   if (response.statusCode == 200) {
//     showDialogSingleButton(
//         context, "Data Retrieved Succesfully", response.body, "OK");

//     return null;
//   } else {
//     showDialogSingleButton(context, "Error", response.body, "OK");
//     return null;
//   }
// }
