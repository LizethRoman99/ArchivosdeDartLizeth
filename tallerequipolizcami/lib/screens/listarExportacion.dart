import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListarExportacionesScreen extends StatefulWidget {
  const ListarExportacionesScreen({Key? key});

  @override
  State<ListarExportacionesScreen> createState() =>
      _ListarExportacionesScreenState();
}

class Exportaciones {
  final String id;
  final String producto;
  final double kilos;
  final double precioKilo;
  final double precioDolar;

  Exportaciones(this.id,
      {required this.producto,
      required this.kilos,
      required this.precioKilo,
      required this.precioDolar});

  factory Exportaciones.fromJson(Map<String, dynamic> json) {
    return Exportaciones(
      json['_id'],
      producto: json['producto'],
      kilos: (json['kilos']?? 0).toDouble(),
      precioKilo:( json['precioKilo']?? 0).toDouble(),
      precioDolar: (json['precioDolar']?? 0).toDouble(),
    );
  }

  static Future<List<Exportaciones>> fetchExportaciones() async {
    final response = await http
        .get(Uri.parse('https://apidolarflutter.onrender.com/exportacion'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> exportacionesJson = jsonData['msg'];
      return exportacionesJson
          .map((json) => Exportaciones.fromJson(json))
          
          .toList();
    } else {
      throw Exception('Fallo la carga de las exportaciones');
    }
  }

  static Future<void> eliminarExportacion(String producto) async {
    try {
      final response = await http.delete(
        Uri.parse('https://apidolarflutter.onrender.com/exportacion'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'producto': producto}),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Fallo al eliminar la exportación: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al eliminar exportación: $error');
      throw error;
    }
  }

  static Future<void> editarExportacion(Exportaciones exportacion) async {
    try {
      final response = await http.put(
        Uri.parse('https://apidolarflutter.onrender.com/exportacion'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id': exportacion.id,
          'producto': exportacion.producto,
          'kilos': exportacion.kilos,
          'precioKilo': exportacion.precioKilo,
          'precioDolar': exportacion.precioDolar,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Fallo al editar la exportación: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al editar exportación: $error');
      throw error;
    }
  }
}

class _ListarExportacionesScreenState extends State<ListarExportacionesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of exportacions'),
      ),
      body: FutureBuilder<List<Exportaciones>>(
        future: Exportaciones.fetchExportaciones(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error} nya');
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final exportaciones = snapshot.data!;

          return ListView.builder(
            itemCount: exportaciones.length,
            itemBuilder: (context, index) {
              final exportacion = exportaciones[index];
              return Card(
                child: ListTile(
                  title: Text('Product: ${exportacion.producto}'),
                  subtitle: Text(
                    'Kilograms: ${exportacion.kilos}\n'
                    'Price of kilograms: ${exportacion.precioKilo}\n'
                    'Price of dolar: ${exportacion.precioDolar}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _editarExportacion(exportacion);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirm elimination'),
                              content:
                                  const Text('¿Are you sure you want to delete this product?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Exportaciones.eliminarExportacion(exportacion.producto)
                                        .then((_) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Exportacion eliminated')),
                                      );
                                      Navigator.pop(context);
                                      setState(() {});
                                    }).catchError((error) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Error al eliminar: $error')),
                                      );
                                    });
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _editarExportacion(Exportaciones exportacion) async {
    final TextEditingController productoController =
        TextEditingController(text: exportacion.producto);
    final TextEditingController kilosController =
        TextEditingController(text: exportacion.kilos.toString());
    final TextEditingController precioKiloController =
        TextEditingController(text: exportacion.precioKilo.toString());
    final TextEditingController precioDolarController =
        TextEditingController(text: exportacion.precioDolar.toString());

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit exportacion'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: productoController,
              decoration: const InputDecoration(labelText: 'Product'),
            ),
            TextField(
              controller: kilosController,
              decoration: const InputDecoration(labelText: 'Kilograms'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: precioKiloController,
              decoration: const InputDecoration(labelText: 'Price of kilograms'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: precioDolarController,
              decoration:
                  const InputDecoration(labelText: 'Price of the dolar'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final producto = productoController.text;
              final kilos = double.parse(kilosController.text);
              final precioKilo = double.parse(precioKiloController.text);
              final precioDolar = double.parse(precioDolarController.text);

            final nuevaExportacion = Exportaciones(exportacion.producto,
                  producto: producto,
                  kilos: kilos,
                  precioKilo: precioKilo,
                  precioDolar: precioDolar);

              Exportaciones.editarExportacion(nuevaExportacion)
                  .then((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exportacion edited')),
                );
                Navigator.pop(context);
                setState(() {});
              }).catchError((error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error al editar: $error')),
                );
              });
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
