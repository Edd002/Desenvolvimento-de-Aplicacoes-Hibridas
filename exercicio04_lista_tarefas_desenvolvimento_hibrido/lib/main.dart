import 'package:exercicio04_lista_tarefas_desenvolvimento_hibrido/views/produto.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/produto.controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ProdutoController>.value(
            value: ProdutoController(),
          ),
        ],
        child: MaterialApp(
          title: 'Lista de Compras',
          debugShowCheckedModeBanner: false,
          home: const ProdutoListView(),
        ));
  }
}
