import 'package:core_movile_app/models/itemOrdenModel.dart';
import 'package:core_movile_app/models/ordenModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'carritoHoder.dart';

class CarritoScreen extends StatefulWidget{
  final OrdenModel model;
  CarritoScreen(this.model);
  
  @override
  _CarritoScreenState createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child:ListView.builder(
                itemCount: widget.model.items.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
              ItemOrdenModel item=widget.model.items[index];
              return  Row(
                      
                            children: 
                            <Widget>[
                            Expanded(child:Text(item.item.nombre),),
                            Expanded( child:Text(item.item.precio.toString()),),
                             Expanded(child:Text(item.cantidad.toString()),),
                            Expanded(child:Text((item.cantidad*item.item.precio).toString())),
         
                          ],
                     
                     );
                 },
          ),
    
          ) 
      ),
    );
  }
}