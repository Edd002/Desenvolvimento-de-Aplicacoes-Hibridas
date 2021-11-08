import 'dart:async';
import 'package:exercicio04_lista_tarefas_desenvolvimento_hibrido/models/produto.model.dart';
import 'package:exercicio04_lista_tarefas_desenvolvimento_hibrido/repositories/produto.dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'produto.database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Produto])
abstract class AppDatabase extends FloorDatabase {
  ProdutoDao get produtoDao;
}
