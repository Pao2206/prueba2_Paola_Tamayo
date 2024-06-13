import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prueba2_paola_tamayo/screens/Login.dart';

void main() {
  runApp(Registro());
}

class Registro extends StatelessWidget {
  const Registro({super.key});

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
        title: const Text('Registro'),
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
          "https://img.freepik.com/free-vector/hand-drawn-butterfly-pattern_23-2151031148.jpg?t=st=1718283674~exp=1718287274~hmac=8f43bb4e907041a565854cb7d41a6b7619a486c317d8f1158b292eea6f35ba43&w=740"),
      fit: BoxFit.fill,
    )),
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CampoNickname(),
        CampoCorreo(),
        CampoClave(),
        
        BotonRegistro(context),
      ],
    )),
  );
}

final TextEditingController _nickname = TextEditingController();
Widget CampoNickname() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
    ),
    child: Column(
      children: [
        SizedBox(height: 10),
        (TextField(
          controller: _nickname,
          decoration: InputDecoration(
            hintText: "Ingresa tu nickname",
            fillColor: Colors.grey.shade200,
            filled: true,
          ),
        )),
      ],
    ),
  );
}

final TextEditingController _correo = TextEditingController();
Widget CampoCorreo() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
    ),
    child: Column(
      children: [
        SizedBox(height: 10),
        (TextField(
          keyboardType: TextInputType.emailAddress,
          controller: _correo,
          decoration: InputDecoration(
            hintText: "Ingresa tu correo",
            fillColor: Colors.grey.shade200,
            filled: true,
          ),
        )),
      ],
    ),
  );
}

final TextEditingController _contrasenia = TextEditingController();
Widget CampoClave() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
    ),
    child: Column(
      children: [
        SizedBox(height: 10),
        (TextField(
          controller: _contrasenia,
          decoration: InputDecoration(
            hintText: "Ingresa tu contraseña",
            fillColor: Colors.grey.shade200,
            filled: true,
          ),
        )),
      ],
    ),
  );
}

Widget BotonRegistro(context) {
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
            guardar();
      },
      child: Text("Registrarse")));
}

Future<void> guardar() async {
DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+_nickname.text);

await ref.set({
  "id": _nickname.text,
  "correo": _correo.text,
});
}