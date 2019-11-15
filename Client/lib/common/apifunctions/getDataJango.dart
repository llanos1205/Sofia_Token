
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_tokenauth/common/apifunctions/WebClient.dart';

import 'package:splash_tokenauth/common/functions/getToken.dart';

import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';
import 'WebClient.dart';
Widget projectWidget() {
  return FutureBuilder(
    builder: (context, projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        //print('project snapshot data is: ${projectSnap.data}');
        return Container();
      }
      return ListView.builder(
        itemCount: projectSnap.data.length,
        itemBuilder: (context, index) {
          ProjectModel project = projectSnap.data[index];
          return Column(
            children: <Widget>[
              // Widget to display the list of project
            ],
          );
        },
      );
    },
    future: getProjectDetails(),
  );
}
https://stackoverflow.com/questions/49930180/flutter-render-widget-after-async-call
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('ProjectList'),
    ),
    body: projectWidget(),
  );
}
Future<List<Widget>> getItems(BuildContext context,int i)async{
  final url = "http://192.168.92.12:8000/core_app/hello/";
   WebClient response= new WebClient();
   var token;

  await getToken().then((result) {
    token = result;
  });
   final x= await response.get(url, {'Authorization': "Bearer $token"});
   List<Widget> list=new List<Widget>();
   final o=x("results");
   for (var item in o) {
     list.add(

            InkWell(
            onTap: ()=>Navigator.of(context).pushReplacementNamed('/DetailScreen'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network(item("imagen")),
                  Text(item("nombre")),
                ],
              )
            ),
          ),
     );
   }
   return list;
}
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