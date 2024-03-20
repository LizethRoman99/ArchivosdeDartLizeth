import 'package:flutter/material.dart';
import 'package:tallerequipolizcami/screens/export.dart';
import 'package:tallerequipolizcami/screens/listarExportacion.dart';
import 'package:tallerequipolizcami/screens/listar_screen.dart';
import 'package:tallerequipolizcami/screens/menu_espa%C3%B1ol.dart';
import 'package:tallerequipolizcami/screens/menu_screen.dart';

class MenuIdiomaScreen extends StatefulWidget {
  const MenuIdiomaScreen({super.key});

  @override
  State<MenuIdiomaScreen> createState() => _MenuIdiomaScreenState();
}

class _MenuIdiomaScreenState extends State<MenuIdiomaScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('IDIOMAS'), backgroundColor: Colors.grey),
        body: ListView(
          children:  [
             ListTile(title: const Text('ENGLISH'),
            subtitle: const Text('EXPORTACIONS'),
            leading: const Icon(Icons.flag_circle_outlined, color: Colors.blueGrey,),
            trailing: const Icon(Icons.navigate_next_outlined),
             onTap: (){
              final route = MaterialPageRoute(builder:(context) => const MenuScreen());
              Navigator.push(context,route);
            },
            ),
           
               ListTile(title: const Text('ESPAÑOL'),
                subtitle: const Text('EXPORTACIONES'),
            leading: const Icon(Icons.flag_circle, color: Colors.brown),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              final route = MaterialPageRoute(builder:(context) => const MenuEspanolScreen());
              Navigator.push(context,route);
            },
            ),
         

          ],
        )
    );
  }
}