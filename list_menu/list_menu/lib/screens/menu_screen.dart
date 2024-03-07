import 'package:flutter/material.dart';
import 'package:list_menu/screens/array_screen.dart';
import 'package:list_menu/screens/login_screen.dart';
import 'package:list_menu/screens/mision_screen.dart';
import 'package:list_menu/screens/mapa_screen.dart';
import 'package:list_menu/screens/rectangulo_screen.dart';

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
      title: const Text('Mi app', style: TextStyle(color:Colors.purple,fontSize: 30),),
      backgroundColor:Colors.deepPurple,
     ), 
     body: ListView(
      children:  [
         const ListTile(title: Text('Home'),
        subtitle: Text('Inicio de lla aplicacion'),
        leading: Icon(Icons.home,color: Colors.blue,),
        trailing:Icon(Icons.navigate_next_outlined)
        
        ),
        ListTile(
          title:  const Text('Productos'),
        subtitle:  const Text('Nuestros Productos'),
        leading:  const Icon(Icons.shop),
        trailing: const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=>const ProductosScreen());
          Navigator.push(context,route);
        },
        

          ),
             ListTile(title:const Text('Mision'),
        subtitle: const Text('Quienes Somos'),
        leading: const Icon(Icons.people_alt_outlined),
        trailing:const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=>const MisionSceen());
          Navigator.push(context,route);
        },
         ),
           ListTile(title:const Text('Array'),
        subtitle: const Text('Listar datos Array'),
        leading: const Icon(Icons.list),
        trailing:const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=>const ScreenArray());
          Navigator.push(context,route);
        },
         ),
           ListTile(title:const Text('Array'),
        subtitle: const Text('Listar datos Array'),
        leading: const Icon(Icons.list),
        trailing:const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=>const RectanguloScreen());
          Navigator.push(context,route);
        },
         ),
          ListTile(title:const Text('Login'),
        subtitle: const Text('Acceso a la aplicacion'),
        leading: const Icon(Icons.list),
        trailing:const Icon(Icons.navigate_next_outlined),
        onTap:(){//abrir otra screen
          final route=MaterialPageRoute(builder:(context)=>const LoginScreen());
          Navigator.push(context,route);
        },
         ),
      ]
     ),
    );
  }
}