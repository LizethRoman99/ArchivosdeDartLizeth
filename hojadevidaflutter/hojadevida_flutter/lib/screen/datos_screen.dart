import 'package:flutter/material.dart';

class DatosPersonales extends StatefulWidget {
  const DatosPersonales({super.key});

  @override
  State<DatosPersonales> createState() => _DatosPersonalesState();
}

class _DatosPersonalesState extends State<DatosPersonales> {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
     appBar: AppBar(
      title: const Text('Hoja de vida', style: TextStyle(color:Color.fromARGB(255, 17, 17, 18),fontSize: 30),),
      backgroundColor:Colors.deepPurple,
     ), 
     body: Padding(
       padding: const EdgeInsets.all(100.0),
       child: ListView(
        children:   const [
           CircleAvatar(
              
             backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAzEd4eBSE9LjnYUxa4ejNEuK88-TkxkwWRA&usqp=CAU'),
              radius: 100 // Ruta de la imagen
            ),
            Center(
              child: ListTile(title: Text('Nombre:Lizeth roman Garcia'),
                        leading:  Icon(Icons.people,color: Colors.green,),
                        ),
            ),
          ListTile(
            title:  Text('Cedula:1042066962'),
          leading:   Icon(Icons.cancel_schedule_send_sharp,color: Colors.green,),
            ),
           ListTile(title:Text('Email:lixeth1999@gmail.com'),
          leading: Icon(Icons.email,color: Colors.green),
          
           ),
            ListTile(title:Text('Residencia:Caldas (Antioquia)'),
          leading: Icon(Icons.email,color: Colors.green),
          
           ),
            
        ]
       ),
     ),
    );
  }
}