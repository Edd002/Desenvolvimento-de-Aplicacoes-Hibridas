import 'package:flutter/material.dart';
import 'package:aula04_desenvolvimento_hibrido/NovasTrasacoes.dart';
import 'package:aula04_desenvolvimento_hibrido/transcoesWidget.dart';
import 'Transacao.dart';

class TransacoesUsuario extends StatefulWidget {
  @override
  _TransacoesUsuarioState createState() => _TransacoesUsuarioState();
}

class _TransacoesUsuarioState extends State<TransacoesUsuario> {
  final List<Transacao> transacoes = [
    Transacao(id: "A1", title: "Café", amount: 2.00, date: DateTime.now()),
    Transacao(
        id: "A2", title: "Pão de queijo", amount: 3.00, date: DateTime.now()),
  ];
  void _addNewTransaction(String txDescritivo, double valor) {
    final novoGasto = Transacao(
        id: DateTime.now().toString(),
        title: txDescritivo,
        amount: valor,
        date: DateTime.now());
    setState(() {
      transacoes.add(novoGasto);
    });
  }

  void _deleteTrasaction(String id) {
    setState(() {
      transacoes.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NovasTrasacoes(_addNewTransaction),
        TransacoesWidget(transacoes, _deleteTrasaction)
      ],
    );
  }
}
