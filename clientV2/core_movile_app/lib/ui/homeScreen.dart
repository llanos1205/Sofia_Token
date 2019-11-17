import 'package:core_movile_app/operations/getDataJango.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String myuser = "";
  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/HomeScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOme Screen'),
      ),
      body:  Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
       

              Text(myuser),
              new Expanded(
                child: FutureBuilder(
                  future: getItems(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GridView.count(
                        crossAxisCount: 2,
                        children: snapshot.data,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
