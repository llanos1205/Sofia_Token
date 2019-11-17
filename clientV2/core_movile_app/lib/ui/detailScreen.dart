import 'package:core_movile_app/models/itemModel.dart';
import 'package:core_movile_app/models/itemOrdenModel.dart';
import 'package:core_movile_app/operations/restCarrito.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget{
  final ItemModel model;
  DetailScreen(this.model);
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final TextEditingController cantidadtext=new TextEditingController();
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context){
    
    final cantidadField = TextField(
          obscureText: false,
          style: widget.style,
          controller: widget.cantidadtext,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Cantidad",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.network(widget.model.imagen),
          Row(
            
            children: <Widget>[
              Expanded(child: Text("Nombre del producto"),)
              ,
              Expanded(child: Text(widget.model.nombre),)
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text("DEscripcion del producto"),),
              Expanded(child: Text(widget.model.descripcion),)
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text("Precio"),),
              Expanded(child: Text(widget.model.precio.toString()),)
            ],
          ),
          cantidadField,
          CupertinoButton(
            child: Text("añadir al carro"), 
            onPressed: () async {
              dynamic ord=await getOrden();
              await updateCarrito(new ItemOrdenModel(int.parse(widget.cantidadtext.text),ord.id,widget.model.id));
            },
          )
        ],
      ),
    );
  }
}