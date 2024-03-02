import 'dart:io';

void almacenarProducto(){
  Map<String, dynamic>productos={};
  print("ingrese los datos de los productos");
  print("Codigo: ");
  productos['codigo']=stdin.readLineSync()!;
  print("Nombre: ");
  productos['nombre']=stdin.readLineSync()!;
  print("producto: ");
  productos['producto']=stdin.readLineSync()!;
  print("Precio: ");
  productos['precio']=stdin.readLineSync()!;

  print("\nDatos del producto");
  print(productos);
  


}