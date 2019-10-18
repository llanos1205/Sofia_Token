import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_tokenauth/common/apifunctions/getDataJango.dart';
import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';
import 'package:splash_tokenauth/common/platform/platformScaffold.dart';
import 'package:splash_tokenauth/common/widgets/basicDrawer.dart';
import 'dart:math' as math;

class DetailScreen extends StatefulWidget{
  @override
  _DetailScreenState createState()=>_DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen>{
  @override
  void initState(){
    super.initState();
    _saveCurrentRoute("/DetailScreen");
  }

_saveCurrentRoute(String x) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', x);
  
}
@override
Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(appBar:AppBar(title: Text("Home Screen", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation:
        Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      drawer:
      BasicDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network('http://sofia.com.bo/wp-content/uploads/2014/13/Pate-de-Higado-de-Pollo-de-100-grsgrande.png'),
              Text("higado de pollo"),
              Text("higado de pollo"),
              Text("higado de pollo"),
              Text("higado de pollo"),
              Text("higado de pollo"),
              Text("higado de pollo"),
              Text("higado de pollo"),
              Text("higado de pollo"),
              Text("higado de pollo"),
              Text("higado de pollo"),
            ],
          ),
        ),
      ),
    );
  }
}