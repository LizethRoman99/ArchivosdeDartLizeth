void main(){
 print('*********FUTURE********');
 calcularFactorial100()
 .then((data){
  print(data);
 });

 calcularFactorial50()
 .then((data){
  print(data);
 });
}

//   calcularFactorial70()
//   .then((data){
//     print(data);
//   });
// }


 Future<String> calcularFactorial100(){
  double factorial=1;
  return Future.delayed(Duration(seconds:2),(){
  for (int i = 1; i < 100; i++) {
    
    factorial=factorial*i; 
  }
  return 'el factorial del 100 es:$factorial';
 });

}

 Future<String> calcularFactorial50(){
  double factorial=1;
  return Future.delayed(Duration(seconds:4),(){
  for (int i = 1; i < 50; i++) {
    factorial=factorial*i; 
  }
  return 'el factorial del 50 es:$factorial';
  });

}
calcularFactorial70(){
  double factorial=1;
   return Future.delayed(Duration(seconds:4),(){
  for (var i = 1; i < 70; i++) {
    factorial=factorial*i; 
  }
  return factorial;
 });



 
}