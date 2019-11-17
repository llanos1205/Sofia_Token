import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:core_movile_app/operations/restLoginAction.dart';
class LoginScreen extends StatefulWidget{
  final TextEditingController usertext=new TextEditingController();
  final TextEditingController passtext=new TextEditingController();
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  

  @override
  Widget build(BuildContext context){
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
        final emailField = TextField(
          obscureText: false,
          style: style,
          controller: widget.usertext,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final passwordField = TextField(
          obscureText: true,
          style: style,
          controller: widget.passtext,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () async {
              await requestLoginAPI(context,widget.usertext.text , widget.passtext.text);
            
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In Screen'),
      ),
      body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15.0),
                  children: <Widget>[
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
      );
}
}