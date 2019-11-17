

import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_movile_app/models/userModel.dart';
saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();


  var user;
  if ((responseJson != null && responseJson.isNotEmpty)) {
    user = UserModel.fromJson(responseJson).userName;
  } else {
    user = "";
  }
  var token = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).token : "";
  var email = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).email : "";
  var pk = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).userId : 0;

  await preferences.setString('LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString('LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('LastEmail', (email != null && email.length > 0) ? email : "");
  await preferences.setInt('LastUserId', (pk != null && pk > 0) ? pk : 0);

}