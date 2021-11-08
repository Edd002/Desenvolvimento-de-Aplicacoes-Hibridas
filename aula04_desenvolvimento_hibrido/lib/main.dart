import 'package:flutter/material.dart';
import 'package:aula04_desenvolvimento_hibrido/NovasTrasacoes.dart';
import 'package:aula04_desenvolvimento_hibrido/TransacoesUsuario.dart';
import 'package:aula04_desenvolvimento_hibrido/transcoesWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Controle de gastos")),
        body: Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(width: double.infinity, child: TransacoesUsuario())
            ])));
  }
}
