//Nombre: Edna Victoria Alvarez Machuca
//Proyecto: App promediar 4 notas

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promedio de Notas', // Título de la app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Promedio de Notas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> _notas = [0, 0, 0, 0]; // Lista para almacenar las 4 notas
  double _promedio = 0.0; // Variable para almacenar el promedio

  final _promedioNotas = List.generate(4, (index) => TextEditingController()); // Lista para campos de texto donde utilizo el metodo .generate.

  void _calcularPromedio() {
    setState(() {
      List<double> notas = [];
      for (int i = 0; i < 4; i++) {
        notas.add(double.parse(_promedioNotas[i].text));
      }

      double suma = 0;
      for (int i = 0; i < notas.length; i++) {
        suma += notas[i];
      }

      _promedio = suma / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), // Título para la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < 4; i++)
                TextFormField(
                  controller: _promedioNotas[i], // Asociar a los campos de texto
                  keyboardType: TextInputType.number, // Configurar el teclado para ingresar números
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nota ${i + 1}", // Etiqueta para el campo de texto
                  ),
                ),
              const SizedBox(height: 20.0),
              OutlinedButton.icon( // Botón para calcular el promedio
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                icon: const Icon(Icons.calculate_outlined, size: 30),
                label: const Text("Calcular Promedio"),
                onPressed: () {
                  _calcularPromedio(); // Llamo la función
                },
              ),
              Text(
                'El promedio es $_promedio', // Muestro en pantalla el resultado
                style: const TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

