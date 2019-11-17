import 'package:core_movile_app/models/itemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailScreen.dart';

class ItemHolder extends StatefulWidget{
  final ItemModel model;
  ItemHolder(this.model);

  @override
  _ItemHolderState createState() => _ItemHolderState();
}

class _ItemHolderState extends State<ItemHolder> {
  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap: () =>
            Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>DetailScreen(widget.model))
                  ),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            child: Column(
              children: <Widget>[
                Image.network(widget.model.imagen),
                Text(widget.model.nombre),
              ],
            )
        ),
      );
  }
}