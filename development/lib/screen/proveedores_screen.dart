import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProveedoresScreen extends StatefulWidget {
  const ProveedoresScreen({super.key});

  @override
  State<ProveedoresScreen> createState() => _ProveedoresScreenState();
}

class _ProveedoresScreenState extends State<ProveedoresScreen> {
   final Map<String, dynamic> proveedorInfo = {};
   void registrar(){
     print(proveedorInfo);
     _mostrarInfoProveedor(context);
  }
   // Método para mostrar la información del proveedor en una ventana emergente
  Future<void> _mostrarInfoProveedor(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información del Proveedor'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: proveedorInfo.entries.map((entry) {
                return Text("${entry.key}: ${entry.value}");
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Proveedor'),
      ),
      body:  Padding(padding: 
      const EdgeInsets.symmetric(vertical:10,horizontal: 15),
      child:Form(
        child: Column(children: [
          TextFormField(
          
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.account_box_rounded,
              color: Color.fromARGB(255, 2, 2, 2),),
              hintText: "Nombre Proveedor",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Nombre Proveedor',
              labelStyle: TextStyle(color: Color.fromRGBO(35, 147, 227, 1),fontSize: 20, fontFamily: AutofillHints.username)
              ),
               onChanged: (value) => proveedorInfo['nombreProveedor'] = value,
          ),
          const SizedBox(
            height: 15,
          ),
              TextFormField( 
              decoration: const InputDecoration(
              prefixIcon: Icon(Icons.adobe_outlined,color:Color.fromARGB(255, 2, 2, 2),),
              hintText: "Nit",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Nit',
              labelStyle: TextStyle(color: Color.fromRGBO(35, 147, 227, 1),fontSize: 20, fontFamily: AutofillHints.username)
              ),
                onChanged: (value) => proveedorInfo['nit'] = value,
                keyboardType: TextInputType.number, // Define el teclado como numérico
                inputFormatters:<TextInputFormatter>[// Formatea la entr
                  FilteringTextInputFormatter.digitsOnly // Permite solo dígitos
                ],
                        // Establece el máximo de caracteres// Define el teclado como numérico
               
                
                  
          ),
           
          
          const SizedBox(height: 20,),
            TextFormField(
           
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person,color: Color.fromARGB(255, 2, 2, 2),),
              hintText: "Direccion",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Direccion',
              labelStyle: TextStyle(color: Color.fromRGBO(35, 147, 227, 1),fontSize: 20, fontFamily: AutofillHints.username)
              ),
                onChanged: (value) => proveedorInfo['direccion'] = value,
               
          ),
          const SizedBox(height: 20,),
              TextFormField(
             
             decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_rounded,color: Color.fromARGB(255, 2, 2, 2),),
              hintText: "Correo",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Correo',
              labelStyle: TextStyle(color: Color.fromRGBO(35, 147, 227, 1),fontSize: 20, fontFamily: AutofillHints.username)
              ),
                onChanged: (value) => proveedorInfo['correo'] = value,
          ),
          const SizedBox(height: 20,),
          TextFormField(
            
             decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person,color: Color.fromARGB(255, 2, 2, 2),),
              hintText: "Nombre de Contacto",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Nombre de Contacto',
              labelStyle: TextStyle(color: Color.fromRGBO(35, 147, 227, 1),fontSize: 20, fontFamily: AutofillHints.username)
              ),
                onChanged: (value) => proveedorInfo['nombreContacto'] = value,
                
          ),
           const SizedBox(height: 20,),
          TextFormField(
            
             decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone,color:Color.fromARGB(255, 2, 2, 2),),
              hintText: "Numero de Contacto",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Numero de Contacto',
              labelStyle: TextStyle(color: Color.fromRGBO(35, 147, 227, 1),fontSize: 20, fontFamily: AutofillHints.username)
              ),
              onChanged: (value) => proveedorInfo['numeroContacto'] = value,
          ),
           const SizedBox(height: 20,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor:const Color.fromRGBO(35, 147, 227, 1),),
            onPressed: registrar, icon: const Icon(Icons.login), label: const Text("Registrar", style: TextStyle(color:Color.fromARGB(255, 2, 2, 2),fontSize: 20)))
        ],
        ),
      ),
    ),
    );
    
}
}