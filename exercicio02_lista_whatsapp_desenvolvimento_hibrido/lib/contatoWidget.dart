import 'package:flutter/material.dart';
import 'Contato.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'InformacoesContato.dart';

class ContatosWidget extends StatelessWidget {
  final List<Contato> contatos;
  final Function deleteTx;
  ContatosWidget(this.contatos, this.deleteTx);

  static Widget getImagenBase64(String image, double width) {
    var _imageBase64 = image;
    const Base64Codec base64 = Base64Codec();
    if (_imageBase64 == null) return new Container();
    var bytes = base64.decode(_imageBase64);
    return Image.memory(
      bytes,
      width: width,
      fit: BoxFit.fitWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: (context, index) {
            return Card(
                child: InkWell(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 2),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child:
                                  getImagenBase64(contatos[index].imageBase64, 15)),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: Text(
                                "${contatos[index].numero}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(contatos[index].nome,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  DateFormat("dd-MM-yyyy HH:mm")
                                      .format(contatos[index].date),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          IconButton(
                              alignment: Alignment.centerRight,
                              onPressed: () => deleteTx(contatos[index].id),
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                        ]),
                    onTap: () {
                      print("Click event on Container");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondRoute(),
                            settings: RouteSettings(
                              arguments: contatos[index],
                            )),
                      );
                    }));
          }),
    );
  }
}
