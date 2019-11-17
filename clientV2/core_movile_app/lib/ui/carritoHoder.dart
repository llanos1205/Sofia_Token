import 'package:core_movile_app/models/itemOrdenModel.dart';
import 'package:core_movile_app/models/ordenModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
List<Widget> panelcomrpas(OrdenModel x){
  List<Widget> temp= new List<Widget>();
  for (var item in x.items) {
    temp.add(
        new Expanded(
             child: Row(
              children: <Widget>[
                //Expanded(child: Image.network(item.item.imagen),),
                Expanded(child: Text(item.item.nombre),),
                Expanded(child: Text(item.item.precio.toString()),),
                Expanded(child: Text(item.cantidad.toString()),),
                Expanded(child: Text((item.cantidad*item.item.precio).toString())),
                
              ],
            )
        ),
     
    );
  }
  return temp;
}
class CarritoHolder extends StatefulWidget{
  final OrdenModel model;
  CarritoHolder(this.model);
  @override
  _CarritoHolderState createState() => _CarritoHolderState();
}

class _CarritoHolderState extends State<CarritoHolder> {
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: widget.model.items.length,
      itemBuilder: (context,index){
        final ItemOrdenModel item=widget.model.items[index];
        return Expanded(
          child: Row(
            children: <Widget>[
                Expanded(child: Text(item.item.nombre),),
                Expanded(child: Text(item.item.precio.toString()),),
                Expanded(child: Text(item.cantidad.toString()),),
                Expanded(child: Text((item.cantidad*item.item.precio).toString())),
         
            ],
          ),
        );
      },
      // scrollDirection: Axis.vertical,
      // children: panelcomrpas(widget.model)
      //<Widget>[
      //   Expanded(
      //     child: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: panelcomrpas(widget.model),
      //   ),
      //   ),
      //   // Row(
      //   //          children:<Widget>[
      //   //           Expanded(child: Text("Total"),),
      //   //           Expanded(child: Text(widget.model.total.toString()),)
      //   //          ],
      //   //   )
      // ],
    );
  }
}