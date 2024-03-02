import 'package:flutter/material.dart';

class NumeroRandom extends StatefulWidget {
  const NumeroRandom ({super.key});

  @override
  State<NumeroRandom > createState() => _NumeroRandom ();
}
int numeroRandomVar=0;
class _NumeroRandom  extends State<NumeroRandom > {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Generar'),
      ),
       body: const Center(child: Text('Numero Random $numeroRandomVar',style: TextStyle(fontSize:30,color: Color.fromARGB(255, 0, 0, 0)),)),
       floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.end,
         children: [
           FloatingActionButton(
           child:const Icon(Icons.add),
            onPressed: (){
             
             
              setState((){});//actualizar el screen
            }),
         ],
    ),
    );
  }
}