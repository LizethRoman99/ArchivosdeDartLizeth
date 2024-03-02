import 'package:flutter/material.dart';

class ContadorScreen extends StatefulWidget {
  const ContadorScreen ({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}
int contadorClicks=0;
//descontar en click
class _ContadorScreenState extends State<ContadorScreen> {
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
       appBar:AppBar(
        backgroundColor: Colors.purple,
        title:Text('contador de clicks:$contadorClicks',style:const TextStyle(color:Color.fromARGB(255, 255, 255, 255))),
       ),
       body: const Center(child: Text('Numero de clicks',style: TextStyle(fontSize:30,color: Color.fromARGB(255, 0, 0, 0)),)),
       floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.end,
         children: [
           FloatingActionButton(
           child:const Icon(Icons.add),
            onPressed: (){
              contadorClicks++;
              print(contadorClicks);
              setState((){});//actualizar el screen
            }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                           child:const Icon(Icons.remove_circle_outline_sharp),
                            onPressed: (){
                contadorClicks--;
                print(contadorClicks);
                setState((){});//actualizar el screen
                            }),
              ),
         ],
       ),
        

    );
   
  }
}