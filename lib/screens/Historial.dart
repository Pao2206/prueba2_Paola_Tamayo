import 'package:flutter/material.dart';

void main() {
  runApp(Historial());
}

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de transacciones'),
      ),
      body: Lista(),
    );
  }
}
class Lista extends StatelessWidget {
  final List<Map<String, dynamic>> transacciones = [
    {
      'retiro': 30,
      'tipo': 'impuestos',
      'saldo': 450,
    },
    {
      'retiro': 50,
      'tipo': 'compras',
      'saldo': 400,
    },
    {
      'retiro': 20,
      'tipo': 'servicios',
      'saldo': 380,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://img.freepik.com/free-photo/spring-scene-with-flowers-butterfly_23-2150169990.jpg?t=st=1718289565~exp=1718293165~hmac=a849b0bc24f9a65209c5f5b6715c98bf02df05b66fcaa47e18653983d8bcd6f1&w=360"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: transacciones.length,
          itemBuilder: (context, index) {
            final transaccion = transacciones[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Retiro: ${transaccion['retiro']}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Tipo: ${transaccion['tipo']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Saldo: ${transaccion['saldo']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}