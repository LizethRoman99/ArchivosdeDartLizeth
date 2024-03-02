
import 'package:contadordevotos/screen/votos_contador.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home:VotacionScreen(key: UniqueKey()), // Proporciona una clave única
    );
  }
}
