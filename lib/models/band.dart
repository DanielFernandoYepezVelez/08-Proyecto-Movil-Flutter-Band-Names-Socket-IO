class Band {
  String id;
  String name;
  int votes;

  Band({required this.id, required this.name, required this.votes});

  /* El Factory Constructor Tiene Como Objetivo Regresar Una Nueva 
    Instancia De Mi Clase */
  factory Band.fromMap(Map<String, dynamic> obj) =>
      Band(id: obj['id'], name: obj['name'], votes: obj['votes']);
}
