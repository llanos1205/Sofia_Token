
class ItemModel {
  final String imagen;
  final String nombre;
  final String descripcion;
  final double precio;
  final int id;

  ItemModel(this.imagen, this.nombre,this.precio, this.descripcion, this.id);

  ItemModel.fromJson(Map<String, dynamic> json)
      : imagen = json['imagen'],
        //token = json['token'],
        nombre=json['token'],
        descripcion = json['descripcion'],
        precio=json['precio'],
        id = json['id'];

  Map<String, dynamic> toJson() =>
      {
        'imagen': imagen,
        'nombre': nombre,
        'descripcion': descripcion,
        'id': id,
        'precio':precio,
      };
}