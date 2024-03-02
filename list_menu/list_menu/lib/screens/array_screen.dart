import 'package:flutter/material.dart';

class ScreenArray extends StatefulWidget {
  const ScreenArray({super.key});

  @override
  State<ScreenArray> createState() => _ScreenArrayState();
}
final List<String> aprendices=['Andrea','Carmen','Devora','Katrina'];
int numeroAprendiz=0;

class _ScreenArrayState extends State<ScreenArray> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recorrido Array'),

      ),
      body: ListView.builder(
        itemCount: aprendices.length,//longitud del array
        itemBuilder:(BuildContext context,  int index){
          numeroAprendiz++;
          return  ListTile(
            leading: const Icon(Icons.people,color: Colors.yellow,),
            title: Text(aprendices[index]),
            subtitle: Text('Aprendiz $index'),

          );
        }
        
        ),

    );
  }
}
/*
Crear un mapa de 10 elementos 3 atributos
las keys(claves):referencia,nombre,precio

Crear una screen para listar El nombre en el titulo y la referencia y precio en el subtitulo
sin realizar cambios en el mapa agregar en la lista el precio en dolares y pesos
*/