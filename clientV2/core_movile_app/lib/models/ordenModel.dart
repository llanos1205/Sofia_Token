import 'package:core_movile_app/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'itemOrdenModel.dart';

class OrdenModel{
  int id;
  String estado;
  double total;
  String fecha;
  List<ItemOrdenModel> items;
  UserModel user;
  OrdenModel(this.estado,this.total,this.fecha);
  OrdenModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    estado=json['estado'];
    total=json['total'];
    fecha=json['fecha'];
    items= new List<ItemOrdenModel>();
    for (dynamic item in json['items']) {
      items.add(new ItemOrdenModel.fromJson(item));
     
   }
    
      
  }
  Future<Map<String,dynamic>> toJson()
      async {
        Map<String,dynamic> result= new Map<String,dynamic>();
        result['estado']= this.estado;
        result['fecha']= this.fecha;
        result['total']= this.total;
        SharedPreferences preferences = await SharedPreferences.getInstance();
        result['cliente']= preferences.getString('LastUserId');
        return result;
      }
}