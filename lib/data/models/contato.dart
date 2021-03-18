class Contato {
  int id;
  String nome;
  String email;
  String telefone;
  String foto;

  Contato({this.id, this.nome, this.email, this.telefone, this.foto});

  Contato.fromMap(Map map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.email = map['email'];
    this.telefone = map['telefone'];
    this.foto = map['foto'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'nome': this.nome,
      'email': this.email,
      'telefone': this.telefone,
      'foto': this.foto
    };

    return map;
  }
}
