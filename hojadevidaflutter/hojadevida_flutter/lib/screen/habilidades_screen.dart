import 'package:flutter/material.dart';

class HabilidadesScreen extends StatefulWidget {
  const HabilidadesScreen({super.key});

  @override
  State<HabilidadesScreen> createState() => _HabilidadesScreenState();
}

class _HabilidadesScreenState extends State<HabilidadesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
      title: const Text('Habilidades', style: TextStyle(color:Color.fromARGB(255, 17, 17, 18),fontSize: 30),),
      backgroundColor:Colors.deepPurple,
     ), 
     body: Center(
       child: Padding(
         padding: const EdgeInsets.all(100.0),
         child: ListView(
          children:   const [
              
             ListTile(title: Text('Javascript'),
              leading:  Icon(Icons.point_of_sale,color: Color.fromARGB(255, 12, 12, 12),),
              ),
              
            ListTile(
              title:  Text('Python'),
            leading:   Icon(Icons.cancel_schedule_send_sharp,color: Color.fromARGB(255, 12, 12, 12),),
              ),
             ListTile(title:Text('c#'),
            leading: Icon(Icons.point_of_sale,color: Color.fromARGB(255, 14, 14, 14)),
            
             ),
              ListTile(title:Text('Java'),
            leading: Icon(Icons.point_of_sale,color: Colors.green),
            
             ),
              ListTile(title:Text('node.js'),
            leading: Icon(Icons.point_of_sale,color: Color.fromARGB(255, 17, 18, 17)),
            
             ),
              
          ]
         ),
       ),
     ),
    );
  }
}