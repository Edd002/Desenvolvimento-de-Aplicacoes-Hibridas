import 'package:flutter/foundation.dart';

class Contato {
  final String id;
  final String nome;
  final String numero;
  final String imageBase64;
  final DateTime date;
  Contato(
      {@required this.id,
      @required this.nome,
      @required this.numero,
      @required this.imageBase64,
      @required this.date}) {}
}
