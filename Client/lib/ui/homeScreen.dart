import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_tokenauth/common/apifunctions/getDataJango.dart';
import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';
import 'package:splash_tokenauth/common/platform/platformScaffold.dart';
import 'package:splash_tokenauth/common/widgets/basicDrawer.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() =>  _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String myuser="";
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
      appBar: AppBar(title: Text("Home Screen", style: TextStyle(color: Colors.black),),
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
              //CollapsingList(),
              
          
              Text(myuser),
              RaisedButton(
                        onPressed: () {
                        getDataJango(context,0);
                        },
                        child: Text("recuperar autenticado",
                            style: TextStyle(color: Colors.white,
                                fontSize: 22.0)
                        ),
                      color: Colors.blue,
                    ),
              RaisedButton(
                onPressed: () {
                getDataJango(context,1);
                },
                child: Text("sin autenticar",
                    style: TextStyle(color: Colors.white,
                        fontSize: 22.0)
                ),
              color: Colors.blue,
              ),
              new Expanded(
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        // Generate 100 Widgets that display their index in the List
        children:getItems(context)
        ),
    ),
    new Expanded(
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 2,
        // Generate 100 Widgets that display their index in the List
        children:<Widget>[
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://sofia.com.bo/wp-content/uploads/2014/13/Pate-de-Higado-de-Pollo-de-100-grsgrande.png'),
                  Text("higado de pollo")
      
                 
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://sofia.com.bo/wp-content/uploads/2014/13/Hamburguesa-Res-Clasica-Sofiagrande.png'),
                  Text("hamboruesa")
                  
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Alitas-Barbacoa-en-Bolsa-grande.png'),
                 Text("alas de pollo")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Nuggets-Dino-500-Grs-en-Cajagrande.png'),
                  Text("nuggets dino")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Hamburguesa-Res-Clasica-Sofia-2grande.png'),
                  Text("clasica grande")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://sofia.com.bo/wp-content/uploads/2014/13/Pate-de-Higado-de-Pollo-de-100-grsgrande.png'),
                  Text("bollo de carne")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://sofia.com.bo/wp-content/uploads/2014/13/Hamburguesa-Res-Clasica-Sofiagrande.png'),
                  Text("carne de res")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Alitas-Barbacoa-en-Bolsa-grande.png'),
                  Text("Alitas de llopo")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Nuggets-Dino-500-Grs-en-Cajagrande.png'),
                  Text("nuggets dino")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Hamburguesa-Res-Clasica-Sofia-2grande.png'),
                  Text("clasica grande")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                
                children: <Widget>[
                  Image.network('http://sofia.com.bo/wp-content/uploads/2014/13/Pate-de-Higado-de-Pollo-de-100-grsgrande.png'),
                  Text("bollo de carne")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://sofia.com.bo/wp-content/uploads/2014/13/Hamburguesa-Res-Clasica-Sofiagrande.png'),
                  Text("carne de res")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Alitas-Barbacoa-en-Bolsa-grande.png'),
                  Text("Alitas de llopo")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Nuggets-Dino-500-Grs-en-Cajagrande.png'),
                  Text("nuggets dino")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://epicemarketing.info/sofia/wp-content/uploads/2014/13/Hamburguesa-Res-Clasica-Sofia-2grande.png'),
                  Text("clasica grande")
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child:Column(
                children: <Widget>[
                  Image.network('http://sofia.com.bo/wp-content/uploads/2014/13/Pate-de-Higado-de-Pollo-de-100-grsgrande.png'),
                  Text("bollo de carne")
                ],
              )
            ),
           
        ]
      ),
    ),
   
 
            ],
          ),
        ),
      ),
    );
  }
}