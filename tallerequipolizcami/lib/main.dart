import 'package:flutter/material.dart';
import 'package:tallerequipolizcami/screens/export.dart';
import 'package:tallerequipolizcami/screens/listarExportacion.dart';
import 'package:tallerequipolizcami/screens/menu_idioma_screen.dart';



void main(){
  runApp(const Main());
}
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ListarDepartamentosScreen(),
      home: MenuIdiomaScreen(),
    );
  }
}