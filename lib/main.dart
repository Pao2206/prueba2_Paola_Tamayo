import 'package:flutter/material.dart';
import 'package:prueba2_paola_tamayo/screens/Login.dart';
import 'package:prueba2_paola_tamayo/screens/Historial.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Prueba2());
}

class Prueba2 extends StatelessWidget {
  const Prueba2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Cuerpo(context),
      Historial(),
      ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba Parcial 2'),
      ),
      body: screens[indice],
     bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.all_out), label: "Prueba"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: "Historial"),
        ],
      ),
      //////////////////////////////
    );
  }
}

Widget Cuerpo(context){
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://img.freepik.com/free-vector/hand-drawn-stencil-element-collection_23-2149718766.jpg?t=st=1718281657~exp=1718285257~hmac=9ebb14607211ff37da776ffc34ea6e35f1d86d64ff286bc05b55ed956adf1ea9&w=740"),
        fit: BoxFit.fill,
        )
    ),
    child: (
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("Paola Tamayo"),
          Text("Pao2206"),
          BotonLogin(context)
        ],
      )
    ),
  );
}

Widget BotonLogin(context) {
  return (FilledButton(
    style: FilledButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 157, 181, 218),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        shape: const StadiumBorder(
          side: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),

        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
      child: Text("Login")));
}

