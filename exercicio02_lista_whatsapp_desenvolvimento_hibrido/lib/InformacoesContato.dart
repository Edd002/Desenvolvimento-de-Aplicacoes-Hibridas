import 'package:exercicio02_lista_whatsapp_desenvolvimento_hibrido/Contato.dart';
import 'package:exercicio02_lista_whatsapp_desenvolvimento_hibrido/contatoWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contato = ModalRoute.of(context).settings.arguments as Contato;

    return Scaffold(
      appBar: AppBar(
        title: Text(contato.nome),
      ),
      body: Center(
        child: buildCard(context, contato),
      ),
    );
  }

  Card buildCard(BuildContext context, Contato contato) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text("Nome: " + contato.nome),
              subtitle: Text("Adicionado em: " +
                  DateFormat("dd-MM-yyyy HH:mm").format(contato.date)),
              trailing: Icon(Icons.phone),
            ),
            Container(
              height: 200.0,
              child: ContatosWidget.getImagenBase64(contato.imageBase64, 200),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              alignment: Alignment.center,
              child: Text(contato.numero,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ));
  }
}
