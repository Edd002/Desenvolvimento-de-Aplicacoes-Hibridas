import 'package:flutter/material.dart';
import 'package:exercicio02_lista_whatsapp_desenvolvimento_hibrido/ContatosUsuario.dart';

// Bibliotecas:
// https://flutterawesome.com/masked-text-input-for-flutter/
// https://pub.dev/packages/fluttertoast

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Lista de Contatos")),
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
              SizedBox(width: double.infinity, child: ContatosUsuario())
            ])));
  }
}
