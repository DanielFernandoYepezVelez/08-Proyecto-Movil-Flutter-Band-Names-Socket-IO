class Band {
  String id;
  String name;
  int votes;

  Band({required this.id, required this.name, required this.votes});

  /* El Factory Constructor Tiene Como Objetivo Regresar Una Nueva 
    Instancia De Mi Clase Mapeada Para Mas Facil Saber Que Tipos De Datos Tiene */
  factory Band.fromMap(Map<String, dynamic> obj) => new Band(
        id: obj.containsKey('id') ? obj['id'] : 'no-id',
        name: obj.containsKey('name') ? obj['name'] : 'no-name',
        votes: obj.containsKey('votes') ? obj['votes'] : 'no-votes',
      );
}
