import 'package:exemplo_sqlite/data/providers/sqlite_helper.dart';

class ContatoProvider {
  SQLiteHelper _sqliteHelper = new SQLiteHelper();

  Future<int> incluir(Map map) async {
    final db = await _sqliteHelper.getDb();
    final int id_gerado = await db.insert(SQLiteHelper.tabela_contato,
        map); //conflictAlgorithm: ConflictAlgorithm.replace

    return id_gerado;
  }

  Future<void> alterar(Map map) async {
    final db = await _sqliteHelper.getDb();
    await db.update(SQLiteHelper.tabela_contato, map,
        where: 'id = ?', whereArgs: [map['id']]);
  }

  Future<bool> excluir(int id) async {
    final db = await _sqliteHelper.getDb();
    final excluido = await db
        .delete(SQLiteHelper.tabela_contato, where: 'id = ?', whereArgs: [id]);

    return excluido > 0 ? true : false;
  }

  Future<List> selecionarTodos() async {
    final db = await _sqliteHelper.getDb();
    List<Map> maps =
        await db.rawQuery('SELECT * FROM ${SQLiteHelper.tabela_contato}');

    return maps;
  }

  Future<Map> selecionar(int id) async {
    final db = await _sqliteHelper.getDb();
    List<Map> maps = await db.query(SQLiteHelper.tabela_contato,
        columns: ['id', 'nome', 'email', 'telefone', 'foto'],
        where: 'id = ?',
        whereArgs: [id],
        distinct: true);

    return maps.length > 0 ? maps[0] : [];
  }
}
