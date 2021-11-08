import 'package:floor/floor.dart';

@entity
class Produto {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? nome;
  bool? concluido;

  Produto({this.id, required this.nome, required this.concluido});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    concluido = json['concluido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['concluido'] = concluido;
    return data;
  }
}
