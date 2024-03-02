import 'dart:math';
import 'dart:io';
abstract class figurasGeometricas{
  double calcularArea();
  double calcularPerimetro();


  
}
class cuadrado extends figurasGeometricas{
  double lado;
  cuadrado(this.lado);

  @override
  double calcularArea() {
    return this.lado * this.lado;
  }

  @override 
  double calcularPerimetro(){
    return 4*this.lado;
  }
}

class rectangulo extends figurasGeometricas{
  double base;
  double altura;
  rectangulo(this.altura,this.base);

  @override
  double  calcularArea(){
     return this.base * this.altura;
     }
     @override
     double calcularPerimetro(){
       return 2*(this.base + this.altura);
     }


}class circulo extends figurasGeometricas {
  double radio;

  circulo(this.radio);

  @override
  double calcularArea() {
    return pi * radio * radio;
  }

  @override
  double calcularPerimetro() {
    return 2 * pi * radio;
  }
}



class  trianguloRectangulo extends figurasGeometricas{  
  double  base;
  double altura;
  trianguloRectangulo(this.altura,this.base);
  @override
  double calcularArea(){
    return (this.altura*this.base)/2;
  }
  @override
  double calcularPerimetro(){
    double hipotenusa=sqrt((this.base*this.base)+(this.altura*this.altura));
    return this.base+this.altura+hipotenusa;

}

}
 void menuFigurasGeometricas(){
  bool volverMenuPrincipal=false;
  while (!volverMenuPrincipal) {
   print("MENÚ DE FIGURAS");
   print("1. Cuadrado");
   print("2. Rectangulo");
   print("3. Circulo");
   print("4. Triangulo rectangulo");
   print("5. volver al menu principal");
   print("6.Ingrese una opcion");

   int opcion=int.parse(stdin.readLineSync()!);
   switch (opcion) {
     case 1:
    calcularCuadrado();
       break;
       case 2:
       calcularRectangulo();
     break;
     case 3:
     calcularCirculo();
     break;
     case 4:
     calcularTrianguloRectangulo();
     break;
     case 5:
     volverMenuPrincipal=true;
     break;
       
       
     default:
     print("opcion no valida, por favor, seleccione una opcion valida ");
     break;
   }
    
  }
 }
 
 void calcularCuadrado() {
  print("Ingrese el lado del cuadrado:");
  var lado = double.parse(stdin.readLineSync()!);
  var Cuadrado = cuadrado(lado);
  print("Área del cuadrado: ${Cuadrado.calcularArea()}");
  print("Perímetro del cuadrado: ${Cuadrado.calcularPerimetro()}");

}
void calcularRectangulo(){
  print("ingrese la base del rectangulo");
  var base =double.parse((stdin.readLineSync())!);
  print("ingrese la altura del rectangulo");
  var altura=double.parse((stdin.readLineSync())!);
  var Rectangulo =rectangulo(altura,base);
   print("Área del cuadrado: ${Rectangulo.calcularArea()}");
  print("Perímetro del cuadrado: ${Rectangulo.calcularPerimetro()}");

}
void calcularCirculo(){
  print("ingrese el radio");
  var radio=double.parse(stdin.readLineSync()!);
  var Circulo=circulo(radio);
  print("Área del círculo:${Circulo.calcularArea()}");
  print("Circunferencia del círculo:${Circulo.calcularPerimetro()}");
}
void calcularTrianguloRectangulo(){
  print("Ingrese la base");
  var base=double.parse((stdin.readLineSync()!));
  print("ingrese la altura");
  var altura=double.parse(stdin.readLineSync()!);
var TrianguloRectangulo=trianguloRectangulo(altura, base);
print("Area del TrianguloRectangulo:${TrianguloRectangulo.calcularArea()}");
print("Perimetro del trianguloRectangulo:${TrianguloRectangulo.calcularPerimetro()}");
}