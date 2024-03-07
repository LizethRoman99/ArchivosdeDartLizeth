import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formLogin =GlobalKey<FormState>();
  String _name="";
  String _password="";

  void acceder(){
    //en construccion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body:  Padding(padding: 
      const EdgeInsets.symmetric(vertical:10,horizontal: 15),
      child:Form(
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person,
              color: Colors.blue,),
              hintText: "Nombre de usuario",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Nombre Usuarios',
              labelStyle: TextStyle(color: Colors.red,fontSize: 20, fontFamily: AutofillHints.username)
              ),
          ),
          const SizedBox(
            height: 15,
          ),
                  TextFormField(
                    obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.password_outlined,color: Colors.blue,),
              suffixIcon: Icon(Icons.password_outlined),
              hintText: "Contraseña",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Nombre Usuarios',
              labelStyle: TextStyle(color: Colors.red,fontSize: 20, fontFamily: AutofillHints.username)
              ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor:Colors.amber),
            onPressed: acceder, icon: const Icon(Icons.login), label: const Text("Acceder"))
        ],
        ),
      ),
    ),
    );
  }
}