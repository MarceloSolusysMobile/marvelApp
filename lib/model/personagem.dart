// Definindo a classe Personagem
class Personagem {
  int id;         // ID do personagem
  String name;    // Nome do personagem
  String avatar;  // URL do avatar do personagem

  // Construtor da classe Personagem com valores padrão
  Personagem({
    this.id = 0,
    this.name = '',
    this.avatar = '',
  });

  // Factory constructor para criar uma instância de Personagem a partir de um mapa JSON
  factory Personagem.fromJson(Map<String, dynamic> json, String key) {
    return Personagem(
      id: json['id'],  // Atribuindo o valor do campo 'id' do JSON ao ID do personagem
      name: json['name'],  // Atribuindo o valor do campo 'name' do JSON ao nome do personagem
      // Criando a URL do avatar combinando 'path' e 'extension' do JSON e adicionando o parâmetro 'key'
      avatar: '${json['thumbnail']['path']}.${json['thumbnail']['extension']}?$key',
    );
  }
}
