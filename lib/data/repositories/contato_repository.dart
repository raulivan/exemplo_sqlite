import 'package:exemplo_sqlite/data/models/contato.dart';
import 'package:exemplo_sqlite/data/providers/contato_provider.dart';

class ContatoRepository {
  static final _provider = new ContatoProvider();

  Future<int> incluir(Contato contato) async {
    return await _provider.incluir(contato.toMap());
  }

  Future<void> alterar(Contato contato) async {
    return await _provider.alterar(contato.toMap());
  }

  Future<bool> excluir(int id) async {
    return await _provider.excluir(id);
  }

  Future<Contato> selecionar(int id) async {
    final map = await _provider.selecionar(id);

    return map.length > 0 ? Contato.fromMap(map) : null;
  }

  Future<List<Contato>> selecionarTodos() async {
    final listMap = await _provider.selecionarTodos();

    var retorno = [];
    for (var item in listMap) retorno.add(Contato.fromMap(item));
    return retorno;
  }
}
