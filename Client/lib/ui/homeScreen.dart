import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_tokenauth/common/apifunctions/getDataJango.dart';
import 'package:splash_tokenauth/common/platform/platformScaffold.dart';
import 'package:splash_tokenauth/common/widgets/basicDrawer.dart';

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
    return PlatformScaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      drawer: BasicDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              //CollapsingList(),

              Text(myuser),
              RaisedButton(
                onPressed: () {
                  getDataJango(context, 0);
                },
                child: Text("recuperar autenticado",
                    style: TextStyle(color: Colors.white, fontSize: 22.0)),
                color: Colors.blue,
              ),
              RaisedButton(
                onPressed: () {
                  getDataJango(context, 1);
                },
                child: Text("sin autenticar",
                    style: TextStyle(color: Colors.white, fontSize: 22.0)),
                color: Colors.blue,
              ),
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
