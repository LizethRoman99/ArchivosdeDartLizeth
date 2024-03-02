import 'dart:io';
import 'figurasgeometricas.dart';
import 'listas.dart';
import 'mapa.dart';

void main() {
  
  bool salir =false;

while (!salir) {
  print("MENÚ DE PRINCIPAL");
  print("1. Orientacion Objetos");
  print("2.Listas");
  print("3.Mapas");
  print("4.Salir");
  print("ingrese su opcion");
  int opcion=int.parse(stdin.readLineSync()!);
 
 switch (opcion) {
   case 1:
   menuFigurasGeometricas();
     break;
     case 2:
     listarNombres();
     break;
     case 3:
     almacenarProducto();
     break;
     case 4:
     salir=true;
     print("saliendo del programa");
     break;
     default:
    print("Opcion valida.Por favor,seleccione una opcion valida");
    break;
   }
  }
}
