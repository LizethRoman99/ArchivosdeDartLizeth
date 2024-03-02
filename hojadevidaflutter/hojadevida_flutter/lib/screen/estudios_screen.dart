import 'package:flutter/material.dart';

class EstudiosScreen extends StatefulWidget {
  const EstudiosScreen({super.key});

  @override
  State<EstudiosScreen> createState() => _EstudiosScreenState();
}

class _EstudiosScreenState extends State<EstudiosScreen> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar:AppBar(
      title: const Text('Estudios', style: TextStyle(color:Color.fromARGB(255, 17, 17, 18),fontSize: 30),),
       backgroundColor:Colors.deepPurple,
     ),
      body:Center(
        child: Container(
          
           margin: const EdgeInsets.symmetric(vertical: 100, horizontal:50),
           height: 300.0,
           width:300.0,
           child:const Text('Hasta el momento estoy cursando quinto trimestre la tecnologia de ADSO(Analisis y Desarrollo De Software) es una tecnologia ')
        
        ),
      )
     
    );
  }
}