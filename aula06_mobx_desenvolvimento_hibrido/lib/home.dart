import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:aula06_mobx_desenvolvimento_hibrido/controller.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* int _contador = 0;
  _incrementar() {
    setState(() {
      _contador++;
    });
  }
*/
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: Observer(builder: (_) {
                  return Text("${controller.contador}",
                      style: const TextStyle(color: Colors.black, fontSize: 80));
                })),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                child: Text(
                  "Incrementar",
                  style: const TextStyle(color: Colors.black, fontSize: 40),
                ),
                onPressed: () {
                  controller.incrementar();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
