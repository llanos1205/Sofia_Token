class ItemModel{
  String nombre;
  String imagen;
  int id;
  double precio;
  String descripcion;
  ItemModel(this.id,this.descripcion,this.nombre,this.precio);
  ItemModel.toJson(Map<String,dynamic> son):
    this.id=son['id'],
    this.nombre=son['nombre'],
    this.precio=son['precio'],
    this.imagen=son['imagen'],
    this.descripcion=son['descripcion'];

  
}