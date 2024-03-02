


 class Inmueble {
  String id;
  String direccion;
  double latitud;
  double longitud;
  double area;
  
  Inmueble(this.id, this.direccion, this.latitud, this.longitud, this.area);
}

class Casa extends Inmueble {
  
  Casa(String id, String direccion, double latitud, double longitud, double area) : super(id, direccion, latitud, longitud, area);
}

class Apartamento extends Inmueble {
  Apartamento(String id, String direccion, double latitud, double longitud, double area) : super(id, direccion, latitud, longitud, area);
}

class Finca extends Inmueble {
  Finca(String id, String direccion, double latitud, double longitud, double area) : super(id, direccion, latitud, longitud, area);
}