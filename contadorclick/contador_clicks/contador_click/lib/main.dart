import 'package:contador_click/screens/Contador_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      // home:Text('contador de clicks'),
      home:ContadorScreen()
    );
  }
}

