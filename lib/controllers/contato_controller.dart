import 'package:exemplo_sqlite/data/models/contato.dart';
import 'package:exemplo_sqlite/data/repositories/contato_repository.dart';
import 'package:flutter/material.dart';

class ContatoController {
  final idController = new TextEditingController();
  final nomeController = new TextEditingController();
  final emailController = new TextEditingController();
  final telefoneController = new TextEditingController();
  final fotoController = new TextEditingController();

  final _repository = ContatoRepository();

  void salvar(BuildContext context) async {
    try {
      //validações dos dados

      int id = idController.text.isEmpty ? 0 : int.parse(idController.text);

      var contato = new Contato(
          id: id,
          email: emailController.text,
          foto: fotoController.text,
          nome: nomeController.text,
          telefone: telefoneController.text);

      if (id == 0) {
        id = await _repository.incluir(contato);
      } else {
        await _repository.alterar(contato);
      }
    } catch (ex) {
      print(ex);
    }
  }
}
