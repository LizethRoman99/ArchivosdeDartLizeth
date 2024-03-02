import 'package:flutter/material.dart';

class MisionSceen extends StatefulWidget {
  const MisionSceen({super.key});

  @override
  State<MisionSceen> createState() => _MisionSceenState();
}

class _MisionSceenState extends State<MisionSceen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar:AppBar(
      title: const Text('Mision')
     ),
      body:Container(
         color:Colors.yellow,
         margin: const EdgeInsets.symmetric(vertical: 100, horizontal:50),
         height: 300.0,
         width:300.0,
         child:const Text('Producir software con altos estandares de "calidad empleando aprender')
      
      )
     
    );
  }
}