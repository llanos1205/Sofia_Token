import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future<String> getuser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String temp=" ";
  temp+=preferences.getString("LastUser");
  temp+=preferences.getString('LastToken');
  temp+=preferences.getString('LastEmail');
  temp+=(preferences.getInt('LastUserId')).toString();
  return temp;
}