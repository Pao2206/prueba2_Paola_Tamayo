import 'package:flutter/material.dart';
import 'package:prueba2_paola_tamayo/screens/Login.dart';

void main() {
  runApp(Cuenta());
}

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

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
        title: const Text('CUENTA'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: NetworkImage(
          "https://img.freepik.com/free-vector/hand-drawn-butterfly-outline-pack_23-2149030327.jpg?t=st=1718286387~exp=1718289987~hmac=9d8b7975dfb0e04aacc5d85043a499c754edc1f003e2761c9f434240531fa03e&w=740"),
      fit: BoxFit.fill,
    )),
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ImagenUsuario(), 
        CampoCuenta(), 
        CampoValor(), 
        BotonCerrar(context)
        ],
    )),
  );
}

Widget ImagenUsuario() {
  return Container(
    padding: EdgeInsets.all(20),
    child: Image.network(
      'https://img.freepik.com/free-photo/stylish-confident-businesswoman-smiling_176420-19466.jpg?t=st=1718287656~exp=1718291256~hmac=f127488bf1e2526fefaf273964ef497e37938f9e53358c9e879542769d74140e&w=996',
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    ),
  );
}

Widget CampoCuenta() {
  return Container(
    padding: EdgeInsets.all(20),
    child: Text(
      "Cuenta Ahorros: 1234567890",
      style: TextStyle(
        backgroundColor: Color.fromARGB(255, 230, 215, 148),
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}

Widget CampoValor() {
  return Container(
    padding: EdgeInsets.all(20),
    child: Text(
      "Valor total: 1000.00",
      style: TextStyle(
        backgroundColor: Color.fromARGB(255, 230, 215, 148),
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}

Widget BotonCerrar(context) {
  return (FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 168, 146, 216),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        shape: const StadiumBorder(
          side: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
      child: Text("Cerrar Sesion")));
}


          


