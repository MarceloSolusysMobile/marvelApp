
class Personagem {
  int id;
  String name;
  String avatar;
  Personagem({
    this.id = 0,
    this.name = '',
    this.avatar = '',
  });

  factory Personagem.fromJson(Map<String, dynamic> json, String key) {
    return Personagem(
        id: json['id'],
        name: json['name'],
        avatar:
            '${json['thumbnail']['path']}.${json['thumbnail']['extension']}?$key');
  }
}