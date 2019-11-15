class OrdenModel {
  final double total;
  final String estado;
  final int cliente;
  final DateTime fecha;
  List<int> compras;
  OrdenModel(this.total,this.estado,this.cliente,this.fecha)
  {
    this.compras=new List();
  }
  Map<String, dynamic> toJson() =>
    {
      'total': total,
      'estado': estado,
      'cliente': cliente,
      'fecha': fecha,
    };
  
}