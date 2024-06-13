import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba2_paola_tamayo/main.dart';
import 'package:prueba2_paola_tamayo/screens/Cuenta.dart';
import 'package:prueba2_paola_tamayo/screens/Registro.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

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
        title: const Text('LOGIN'),
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
          "https://img.freepik.com/free-vector/watercolor-butterfly-pattern-illustration_23-2151086214.jpg?t=st=1718282828~exp=1718286428~hmac=9e0c22c4730dd129514e4b9b59c6c9e52f44cc637f1cba5c171100e1c9022caa&w=740"),
      fit: BoxFit.fill,
    )),
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        BotonRegresar(context),
        CampoCorreo(),
        CampoClave(),
        BotonInicio(context),
        BotonRegistro(context),
      ],
    )),
  );
}

final TextEditingController _correo = TextEditingController();
Widget CampoCorreo() {
  return Container(
    padding: EdgeInsets.all(20),
    child: (TextField(
      controller: _correo,
      decoration: InputDecoration(hintText: "Ingresa tu usuario o e-mail"),
      keyboardType: TextInputType.emailAddress,
    )),
  );
}

final TextEditingController _contrasenia = TextEditingController();
Widget CampoClave() {
  return Container(
    padding: EdgeInsets.all(20),
    child: (TextField(
      controller: _contrasenia,
      decoration: InputDecoration(hintText: "Ingresa tu contraseña"),
    )),
  );
}

Widget BotonInicio(context) {
  return (FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 226, 145, 206),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        shape: const StadiumBorder(
          side: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
        ),
      ),
      onPressed: () {
        login(context);
      },
      child: Text("Ingresar")));
}

Future<void> login(context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _correo.text, password: _contrasenia.text);
    ////////////////////
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cuenta()));
    ///////////////////
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

void alertaFalla(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("ATENCION"),
          content: Text("El correo o la contraseña son incorrectos"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cerrar"))
          ],
        );
      });
}

Widget BotonRegistro(context) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: Color.fromARGB(255, 0, 0, 0),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      );
    },
    child: Text(
      "¿No tienes una cuenta? Regístrate",
      style: TextStyle(
        fontSize: 17,
      ),
    ),
  );
}

Widget BotonRegresar(context) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: Color.fromARGB(255, 0, 0, 0),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Prueba2()),
      );
    },
    child: Text(
      "Regresar",
      style: TextStyle(
        fontSize: 17,
      ),
    ),
  );
}
