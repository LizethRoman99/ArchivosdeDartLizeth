import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tallerequipolizcami/screens/listarExportacion.dart';

class Export extends StatefulWidget {
  const Export({Key? key});

  @override
  State<Export> createState() => _ExportState();
}

class _ExportState extends State<Export> {
  late TextEditingController producto;
  late TextEditingController kilos;
  late TextEditingController precioKilo;
  late TextEditingController precioDolar;

  double valorDolar = 0.0;

  @override
  void initState() {
    super.initState();
    producto = TextEditingController();
    kilos = TextEditingController();
    precioKilo = TextEditingController();
    precioDolar = TextEditingController();

    obtenerValorDolar();
  }

  Future<void> obtenerValorDolar() async {
    try {
      final response =
          await http.get(Uri.parse('https://www.datos.gov.co/resource/mcec-87by.json'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          setState(() {
            valorDolar = double.parse(data.first['valor'].toString());
            precioDolar.text = valorDolar.toString();
          });
        }
      }
    } catch (error) {
      print('Error al obtener el valor del dólar: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export formulary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: producto,
              decoration: const InputDecoration(hintText: "Product"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: kilos,
              decoration: const InputDecoration(hintText: "Kilograms"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: precioKilo,
              decoration: const InputDecoration(hintText: "Price of kilograms"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: precioDolar,
              decoration: const InputDecoration(hintText: "Price of the dollar"),
              enabled: false, // Deshabilita la edición del campo
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                var export = {
                  "producto": producto.text,
                  "kilos": double.parse(kilos.text),
                  "precioKilo": double.parse(precioKilo.text),
                  "precioDolar": valorDolar, // Usar el valor del dólar obtenido
                };

                print(export);
                Http.postUsuario(export,context); // Aquí enviamos los datos al servidor
              },
              icon: const Icon(Icons.monetization_on),
              label: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

class Http {
  static String url = "https://apidolarflutter.onrender.com/exportacion";
  static postUsuario(Map exportacion,context) async {
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(exportacion),
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
          showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Successful registration'),
        content: const Text('The supplier has been successfully added'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
              Navigator.push( // Redirige al usuario a la pantalla de listar proveedores
                context,
                MaterialPageRoute(builder: (context) => const ListarExportacionesScreen()),
              );
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
      } else {
        print('Fallo la inserción');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
