import 'package:flutter/material.dart';
import 'package:tallerequipolizcami/screens/listar_screen.dart';
import 'package:tallerequipolizcami/screens/registrar.dart';

class MenuEspanolScreen extends StatefulWidget {
  const MenuEspanolScreen({super.key});

  @override
  State<MenuEspanolScreen> createState() => _MenuEspanolScreenState();
}

class _MenuEspanolScreenState extends State<MenuEspanolScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('EXPORTACIONES'), backgroundColor: Colors.grey),
        body: ListView(
          children:  [
            ListTile(title: const Text('Registrar'),
            leading: const Icon(Icons.login, color: Colors.brown),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              final route = MaterialPageRoute(builder:(context) => const RegistrarSreen());
              Navigator.push(context,route);
            },
            ),
               ListTile(title: const Text('Listar Exportaciones'),
            leading: const Icon(Icons.list, color: Colors.brown),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              final route = MaterialPageRoute(builder:(context) => const ListarEspanolScreen());
              Navigator.push(context,route);
            },
            ),
         

          ],
        )
    );
  }
}