import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class NovosContatos extends StatelessWidget {
  final nomeController = TextEditingController();
  final numeroController = new MaskedTextController(mask: '00000-0000');
  final Function addTx;
  NovosContatos(this.addTx);

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
                  controller: nomeController,
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: numeroController,
                  decoration: InputDecoration(labelText: "Número"),
                  onSubmitted: (_) =>
                      {addTx(nomeController.text, numeroController.text)},
                ),
                ElevatedButton(
                    onPressed: () {
                      addTx(nomeController.text, numeroController.text);
                    },
                    child: Text("Adicionar"))
              ],
            )));
  }
}
