import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyAppState()));
}

class MyAppState extends StatefulWidget {
  @override
  _MyAppStateState createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  var resposta = 0;

  body() {
    return Column(
      children: [
        const Text("Informe seus dados: "),
        ElevatedButton(onPressed: calcular, child: const Text("Calcular")),
        Text("Resposta: " + resposta.toString())
      ]);
  }

  calcular() {
    setState(() {
      resposta++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMC"),
        ),
        body: body());
  }
}