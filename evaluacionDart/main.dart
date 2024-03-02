import 'inmueble.dart';
import 'dart:io';

void main() {
  print('Inmobiliaria Lizeth Roman');


  // Solicitar al usuario el número de inmuebles a ingresar
  stdout.write('Ingrese el número de inmuebles: ');
  int n = int.parse(stdin.readLineSync()!);

  // Crear los mapas para cada tipo de inmueble
  Map<String, double> casasMap = {};
  Map<String, double> apartamentosMap = {};
  Map<String, double> fincasMap = {};

  // Ingresar los inmuebles
  for (int i = 1; i <= n; i++) {
    stdout.write('\nInmueble $i\n');
   
 final casa=new Casa("78", "yfhfh",78, 78, 89);
 print(casa);
 print(casa.direccion);
 final finca=new Finca("67","hgg",89,90,78);
 print(finca);
 print(finca.direccion);
    // Solicitar los datos del inmueble
    stdout.write('Tipo de inmueble (Apartamento, Casa, Finca): ');
    String tipo = stdin.readLineSync()!;

    stdout.write('ID: ');
    String id = stdin.readLineSync()!;

    stdout.write('Dirección: ');
    String direccion = stdin.readLineSync()!;
   

    stdout.write('Latitud: ');
    double latitud = double.parse(stdin.readLineSync()!);

    stdout.write('Longitud: ');
    double longitud = double.parse(stdin.readLineSync()!);

    stdout.write('Área en metros cuadrados: ');
    double area = double.parse(stdin.readLineSync()!);
   
  

    // Calcular el valor comercial
    stdout.write('Valor del metro cuadrado: ');
    double valorMetroCuadrado = double.parse(stdin.readLineSync()!);

    double valorComercial = area * valorMetroCuadrado;

    

    // Almacenar en el mapa correspondiente
    if (tipo == 'Casa') {
      casasMap[direccion] = valorComercial;
    } else if (tipo == 'Apartamento') {
      apartamentosMap[direccion] = valorComercial;
    } else if (tipo == 'Finca') {
      fincasMap[direccion] = valorComercial;
    }

    // Imprimir el valor comercial del inmueble agregado
    print('Valor comercial del inmueble $i: \$${valorComercial.toStringAsFixed(2)}');
  }

  // Imprimir la cantidad por tipos de inmuebles
  print('\nCantidad por tipos de inmuebles:');
  print('Casas: ${casasMap.length}');
  print('Apartamentos: ${apartamentosMap.length}');
  print('Fincas: ${fincasMap.length}');

  // Calcular la suma total de los valores comerciales
  double sumaTotal = 0.0;//inicializando
  casasMap.forEach((key, value) => sumaTotal += value);//clave valor en el foreach
  apartamentosMap.forEach((key, value) => sumaTotal += value);
  fincasMap.forEach((key, value) => sumaTotal += value);

  // Imprimir la suma total de los valores comerciales
  print('Suma total de valores comerciales: \$${sumaTotal.toStringAsFixed(2)}');
}