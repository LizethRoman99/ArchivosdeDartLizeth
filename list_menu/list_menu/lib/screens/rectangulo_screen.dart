import 'package:flutter/material.dart';

class RectanguloScreen extends StatefulWidget {
  const RectanguloScreen({super.key});

  @override
  State<RectanguloScreen> createState() => _RectanguloScreenState();
}

class _RectanguloScreenState extends State<RectanguloScreen> {
  TextEditingController largoController = TextEditingController();
  TextEditingController anchoController = TextEditingController();
  String resultado= '', perimetro='';
  void calcularArea(){
    try {
      double largo=double.parse(largoController.text);
      double ancho=double.parse(anchoController.text);
      double area=ancho*largo;
      setState(() {
        resultado = 'el area es:$area';
      });
      
    } catch (e) {
      
     setState(() {
        resultado = 'No se puede calcular verifique';
      });
      
    }


  }
  void calcularPerimetro(){
     try {
      double largo=double.parse(largoController.text);
      double ancho=double.parse(anchoController.text);
      double perimetro=2*ancho+2*largo;
      setState(() {
        resultado = 'el area es:$perimetro';
      });
      
    } catch (e) {
      
     setState(() {
        resultado = 'No se puede calcular verifique';
      });
      
    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rectángulos'),
      ),
      body:Center(
        child: Container(
          width:200,
          height:300,
          color: Colors.black45,
          child:Column(
            children: [
              TextField(

                controller:largoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText:'Largo',
                labelStyle:TextStyle(fontWeight: FontWeight.bold),
                
                ),
                maxLength: 3,
                
              ),
               TextField(
                controller:anchoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText:'Ancho'),
              ),
             
              ElevatedButton(onPressed:calcularArea, child: const Text('Calcular Area')),
               const SizedBox(height: 20,),
               Text('Area:$resultado'),
                ElevatedButton(onPressed:calcularArea, child: const Text('Calcular Perimetro')),
               const SizedBox(height: 20,),
               Text('Perimetro:$resultado'),
            ],
          ),
        ),
      ),
    );
  }
}