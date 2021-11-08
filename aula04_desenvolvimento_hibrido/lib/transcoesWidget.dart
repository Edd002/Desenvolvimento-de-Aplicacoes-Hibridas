import 'package:flutter/material.dart';
import 'Transacao.dart';
import 'package:intl/intl.dart';

class TransacoesWidget extends StatelessWidget {
  final List<Transacao> transacaoAux;
  final Function deleteTx;
  TransacoesWidget(this.transacaoAux, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: ListView(
          children: transacaoAux.map((trans) {
            return Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        "R\$ ${trans.amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(trans.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(DateFormat("dd-MM-yyyy HH:mm").format(trans.date),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () => deleteTx(trans.id),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ]));
          }).toList(),
        ));
  }
}
