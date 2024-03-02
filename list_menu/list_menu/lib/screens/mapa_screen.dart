import 'package:flutter/material.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}
final Map<String, dynamic> productos = {
    "Celular": {'Descripcion':'iphone pro max','precio':3000000},
    "Televison": {'Descripcion':'Smart tv de 50 pulgadas','precio':5000000},
    "Audifonos":{'Descripcion':'airpods tercera generacion','precio':120000},
    "Mouse":{'Descripcion':'airpods tercera generacion','precio':120000},
    "laptop":{'Descripcion':'airpods tercera generacion','precio':120000},
    "Cargador":{'Descripcion':'el mas potente de la historia','precio':120000},
    "Teclado":{'Descripcion':'mac de terecera generacion','precio':120000},
    "Lechuga":{'Descripcion':'Fresca y bonita','precio':120000},
    "Manzana":{'Descripcion':'Rojita y cero podrida','precio':120000},
   

};
double precioDolar=0;

class _ProductosScreenState extends State<ProductosScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          precioDolar=productos[productos.keys.elementAt(index)]?['precio']/3500;
          precioDolar=precioDolar.roundToDouble();
          return ListTile(
            title: Text(productos.keys.elementAt(index)),
            subtitle: Text(
                'Descripcion: ${productos[productos.keys.elementAt(index)]?['Descripcion']} \nPrecio: ${productos[productos.keys.elementAt(index)]?['precio']}\nPrecio Dolares: $precioDolar'),
            leading: const Icon(
              Icons.shopping_cart,
              size: 25,
              color: Colors.blueAccent,
            ),
          );
        },
      ),
     
    );
  }
}