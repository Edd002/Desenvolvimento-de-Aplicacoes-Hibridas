import 'package:flutter/material.dart';

class NovasTrasacoes extends StatelessWidget {
  final descritivoController = TextEditingController();
  final gastoController = TextEditingController();
  final Function addTx;
  NovasTrasacoes(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: descritivoController,
                  decoration: InputDecoration(labelText: "Descrição"),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: gastoController,
                  decoration: InputDecoration(labelText: "Preço"),
                  onSubmitted: (_) => {
                    addTx(descritivoController.text,
                        double.parse(gastoController.text))
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      addTx(descritivoController.text,
                          double.parse(gastoController.text));
                    },
                    child: Text("Incluir"))
              ],
            )));
  }
}
