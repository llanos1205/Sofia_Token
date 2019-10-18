import 'package:flutter/material.dart';

import 'package:splash_tokenauth/ui/homeScreen.dart';
import 'package:splash_tokenauth/ui/loginScreen.dart';
import 'package:splash_tokenauth/ui/splashScreen.dart';
import 'package:splash_tokenauth/ui/detailScreen.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  var _splashShown = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Splash and Token Authentication",
      routes: <String,WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => HomeScreen(),
        "/LoginScreen": (BuildContext context) => LoginScreen(),
        "/DetailScreen": (BuildContext context) => DetailScreen(),
      },
      home:
      SplashScreen()
      );
      }
}
