import 'package:aula06_floor_sqllite_desenvolvimento_hibrido/controllers/produto.controller.dart';
import 'package:aula06_floor_sqllite_desenvolvimento_hibrido/models/produto.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../app_status.dart';

class ProdutoListView extends StatefulWidget {
  const ProdutoListView({Key? key}) : super(key: key);

  @override
  _ProdutoListViewState createState() => _ProdutoListViewState();
}

class _ProdutoListViewState extends State<ProdutoListView> {
  final _formKey = GlobalKey<FormState>();
  final _itemController = TextEditingController();
  ProdutoController? _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<ProdutoController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Compras'), centerTitle: true),
      body: Scrollbar(
        child: Observer(builder: (_) {
          if (_controller!.status == AppStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_controller!.status == AppStatus.success) {
            return ListView(
              children: [
                for (int i = 0; i < _controller!.list.length; i++)
                  ListTile(
                      title: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: _controller!.list[i].concluido!
                        ? Text(
                            _controller!.list[i].nome!,
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          )
                        : Text(_controller!.list[i].nome!),
                    value: _controller!.list[i].concluido,
                    secondary: IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 20.0,
                        color: Colors.red[900],
                      ),
                      onPressed: () async {
                        await _controller!.delete(_controller!.list[i].id!);
                      },
                    ),
                    onChanged: (c) async {
                      Produto edited = _controller!.list[i];
                      edited.concluido = c!;
                      await _controller!.update(edited);
                    },
                  )),
              ],
            );
          } else {
            return const Text("Carregando... ");
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _displayDialog(context),
      ),
    );
  }

  _displayDialog(context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: _itemController,
                validator: (s) {
                  if (s!.isEmpty) {
                    return "Digite o produto.";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "Produto"),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('SALVAR'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _controller!.create(
                        Produto(nome: _itemController.text, concluido: false));
                    _itemController.text = "";
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          );
        });
  }
}
