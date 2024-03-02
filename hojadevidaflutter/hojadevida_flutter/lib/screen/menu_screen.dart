import 'package:flutter/material.dart';
import 'package:hojadevida_flutter/screen/datos_screen.dart';
import 'package:hojadevida_flutter/screen/estudios_screen.dart';
import 'package:hojadevida_flutter/screen/habilidades_screen.dart';


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
      title: const Text('Hoja de vida', style: TextStyle(color:Color.fromARGB(255, 15, 14, 15),fontSize: 30),),
      backgroundColor:Colors.deepPurple,
     ), 
     body: ListView(
      children:  [
          ListTile(title: const Text('Datos personales'),
        leading: const Icon(Icons.home,color: Color.fromRGBO(189, 42, 174, 1)),
        trailing:const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=>const DatosPersonales());
          Navigator.push(context,route);
        },
        
        ),
        ListTile(
          title:  const Text('Habilidades'),
        leading:  const Icon(Icons.shop,color: Color.fromRGBO(189, 42, 174, 1)),
        trailing: const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=>const HabilidadesScreen());
          Navigator.push(context,route);
        },
        

          ),
             ListTile(title:const Text('Estudios'),
        subtitle: const Text('Quienes Somos'),
        leading: const Icon(Icons.people_alt_outlined,color: Color.fromRGBO(189, 42, 174, 1)),
        trailing:const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=> const EstudiosScreen());
          Navigator.push(context,route);
        },
         ),
          
      ]
     ),
    );
  }
}