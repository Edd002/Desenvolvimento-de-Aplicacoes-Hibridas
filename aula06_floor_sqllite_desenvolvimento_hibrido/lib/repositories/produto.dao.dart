import 'package:aula06_floor_sqllite_desenvolvimento_hibrido/models/produto.model.dart';
import 'package:floor/floor.dart';

@dao
abstract class ProdutoDao {
  @Query('SELECT * FROM Produto order by concluido, nome')
  Future<List<Produto>> getAll();

  @Query("SELECT * from Produto where id is not null and id = :id")
  Future<Produto?> getProdutoById(int id);

  @insert
  Future<int> insertProduto(Produto p);

  @update
  Future<int> updateProduto(Produto p);

  @delete
  Future<int> deleteProduto(Produto p);
}
