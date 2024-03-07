import 'package:development/screen/proveedores_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
     appBar: AppBar(
      title: const Center(child: Text('Menú', style: TextStyle(color:Color.fromARGB(255, 0, 0, 0),fontSize: 30),)),
      backgroundColor:Colors.deepPurple,
     ), 
     body: ListView(
      children:  [
         
        ListTile(
          title:  const Text('Proveedores'),
        leading:  const Icon(Icons.shop_2_outlined),
        trailing: const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=>const ProveedoresScreen());
          Navigator.push(context,route);
        },
          ),
      ]
     ),
    );
  }
}