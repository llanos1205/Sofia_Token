import 'package:core_movile_app/models/itemModel.dart';

class ItemOrdenModel{
  int id;
  int cantidad;
  int orden;
  int producto;
  ItemModel item;
  ItemOrdenModel(this.cantidad,this.orden,this.producto);
  ItemOrdenModel.fromJson(Map<String,dynamic> x){
    this.id=x['id'];
    this.cantidad=x['cantidad'];
    this.orden=x['orden'];
   
    this.item=ItemModel.toJson(x['producto']);
     this.producto=this.item.id;
  }
  Map<String,dynamic> toJson()=>{
    'cantidad':this.cantidad,
    'orden':this.orden,
    'producto':this.producto
  };
}