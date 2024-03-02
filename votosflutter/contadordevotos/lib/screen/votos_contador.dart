import 'package:flutter/material.dart';
import 'dart:async';

class VotacionScreen extends StatefulWidget {
  const VotacionScreen({required Key key}) : super(key: key);

  @override
  State<VotacionScreen> createState() => _VotacionScreenState();
}

int contadorVotosA = 0;
int contadorVotosB = 0;
int contadorVotosC = 0;
int contadorVotos = 0;
double porcentajeVotosA = 0;
double porcentajeVotosB = 0;
double porcentajeVotosC = 0;

class _VotacionScreenState extends State<VotacionScreen> {
  int tiempoLimite = 60; // Tiempo límite de votación en segundos
  bool votacionFinalizada = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // Función para calcular los porcentajes
  void calcularPorcentajes() {
    porcentajeVotosA = (contadorVotosA / contadorVotos) * 100;
    porcentajeVotosB = (contadorVotosB / contadorVotos) * 100;
    porcentajeVotosC = (contadorVotosC / contadorVotos) * 100;
  }

  // Función para iniciar el temporizador
  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (tiempoLimite < 1) {
          timer.cancel();
          votacionFinalizada = true;
        } else {
          tiempoLimite -= 1;
        }
      });
    });
  }

  // Función para obtener el nombre del candidato ganador
  String obtenerGanador() {
    if (contadorVotosA > contadorVotosB && contadorVotosA > contadorVotosC) {
      return 'Candidato A';
    } else if (contadorVotosB > contadorVotosA && contadorVotosB > contadorVotosC) {
      return 'Candidato B';
    } else if (contadorVotosC > contadorVotosA && contadorVotosC > contadorVotosB) {
      return 'Candidato C';
    } else {
      return 'Empate';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Número de votos: $contadorVotos'),
        backgroundColor: const Color.fromARGB(255, 38, 41, 240),
      ),
      body: 
         ListView(
          children: [
            Text(
              'Tiempo restante: $tiempoLimite segundos',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              votacionFinalizada ? 'Votación finalizada' : '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Ganador: ${obtenerGanador()}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      
      floatingActionButton: Center(
        child: Padding(
          padding: const EdgeInsets.all(120.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: SizedBox(
                  width: 190,
                  height: 178,
                  child: FloatingActionButton(
                    onPressed: votacionFinalizada
                        ? null
                        : () {
                            contadorVotosA++;
                            contadorVotos++;
                            calcularPorcentajes();
                            setState(() {});
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Text(
                        'CANDIDATO A\nNúmero de votos: $contadorVotosA\nPorcentaje de votos: ${porcentajeVotosA.toStringAsFixed(2)}%\n',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 190,
                  height: 178,
                  child: FloatingActionButton(
                    onPressed: votacionFinalizada
                        ? null
                        : () {
                            contadorVotosB++;
                            contadorVotos++;
                            calcularPorcentajes();
                            setState(() {});
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Text(
                        'CANDIDATO B\nNúmero de votos: $contadorVotosB\nPorcentaje de votos: ${porcentajeVotosB.toStringAsFixed(2)}%\n',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 190,
                  height: 178,
                  child: FloatingActionButton(
                    onPressed: votacionFinalizada
                        ? null
                        : () {
                            contadorVotosC++;
                            contadorVotos++;
                            calcularPorcentajes();
                            setState(() {});
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Text(
                        'CANDIDATO C\nNúmero de votos: $contadorVotosC\nPorcentaje de votos: ${porcentajeVotosC.toStringAsFixed(2)}%\n',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}