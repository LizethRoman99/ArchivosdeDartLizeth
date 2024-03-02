import 'dart:io';

void listarNombres(){
  List<String>listaM=[];
  List<String>listaF=[];

   print("ingrese 10 nombres con su genero(F O f para femenino) o (M o m para masculino)");
   for (var i = 1; i <10; i++) {
    print("ingrese nombre:${i}");
    var nombre=stdin.readLineSync()!;
    print("ingrese el genero (M - f) o (F - f)");
    var genero=stdin.readLineSync()!;
    if (genero == 'M'|| genero=='m') {
      listaM.add(nombre);
      
    }else if(genero=='F'||genero=='f'){
      listaF.add(nombre);
      
    }else{
      print("genero no valido,por favor ingrese uno valido");
    }
     
   }
   print("lista de los nombres masculinos");
   print(listaM);
   print("lista de los nombres femeninos");
   print(listaF);
}