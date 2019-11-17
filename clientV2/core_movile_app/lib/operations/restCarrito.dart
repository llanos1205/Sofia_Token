import 'dart:convert';

import 'package:core_movile_app/models/itemOrdenModel.dart';
import 'package:core_movile_app/models/ordenModel.dart';
import 'package:core_movile_app/services/webClientService.dart';

Future<OrdenModel> getOrden() async 
{
  WebClient x= new WebClient();
  String token;
  await x.getToken().then((result) {
    token = result;
  });

  dynamic result=await x.get(x.setPath('/core_app/Ordenes/?estado=PENDIENTE'),{'Authorization': "Bearer $token"});
  if(result.length==0){
    OrdenModel temp=new OrdenModel("PENDIENTE",0, DateTime.now().toString());
    x.post('/core_app/Ordenes/', jsonEncode(temp.toJson()), {'Authorization': "Bearer $token"});
    result=x.get(x.setPath('/core_app/Ordenes/?estado=PENDIENTE'),{'Authorization': "Bearer $token"});
  }
  return OrdenModel.fromJson(result[0]);
}
Future<bool> updateCarrito(ItemOrdenModel y)async{
  WebClient x= new WebClient();
  String token;
  await x.getToken().then((result) {
    token = result;
  });

  await x.post(x.setPath('/core_app/Ordenes_Items/'),jsonEncode(y.toJson()),{'Authorization': "Bearer $token","Content-Type": "application/json"});
  if(x.statusCode==200){
    return true;
  }
  return false;
}