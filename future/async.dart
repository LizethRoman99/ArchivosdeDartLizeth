void main() async {
  
  print("preparacion sincronica de alimentos");
  final preparacion1 = await(prepararAgua());
  print(preparacion1);
  final preparacion2 =await(prepararHuevos());
  print(preparacion2);
  final preparacion3 =await(prepararCafe());
  print(preparacion3);
  final preparacion4 =await(prepararjugo());
  print(preparacion4);
  print("preparacion asincronico de alimentos");
  prepararAgua().then(print);
  prepararHuevos().then(print);
  prepararCafe().then(print);
  prepararjugo().then(print);
}
Future<String>prepararAgua()async{
  return Future.delayed(new Duration( seconds:5),(){
    return 'Agua preparada en 5 segundos';
  });


}
Future<String>prepararHuevos()async{
  return Future.delayed(new Duration( seconds:15),(){
    return 'Huevos preparado en 7 segundos';
  });
  

}
Future<String>prepararCafe()async{
  return Future.delayed(new Duration( seconds:10),(){
    return 'cafe preparado en 10 segundos';
  });
  

}
Future<String>prepararjugo()async{
  return Future.delayed(new Duration( seconds:12),(){
    return 'jugo preparado en 12 segundos';
  });
  

}