import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteHelper {
  static final SQLiteHelper _instance = new SQLiteHelper.internal();
  factory SQLiteHelper() => _instance;
  SQLiteHelper.internal();

  Database _db;

  //Tabelas
  static final String tabela_contato = 'contato';

  Future<Database> _initDataBase() async {
    final caminho_db = await getDatabasesPath();
    final nome_db = 'agenda_db.db';
    final path = join(caminho_db, nome_db);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newVersion) async {
      //Scripts de criações de todas as tabelas
      List<String> scripts = [
        'CREATE TABLE $tabela_contato (id INTEGER PRIMARY KEY, nome TEXT, email TEXT, telefone TEXT, foto TEXT)'
      ];

      //Executar um de cada vez
      for (String sql in scripts) await db.execute(sql);
    });
  }

  Future<Database> getDb() async {
    if (_db == null) return await _initDataBase();
    return _db;
  }
}
