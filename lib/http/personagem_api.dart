import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/personagem.dart';

class PersonagemApi {
  final String publicKey = '0ea28726a5bc45579f222022fccbc6dc';
  final String hash = '3b038adcc3be49ab173cc9c47713cad1';
  final String ts = '1';
  final String url = 'https://gateway.marvel.com/v1/public/characters?';

  List<Personagem> parsePersonagem(String responseBody) {
    final parsed = jsonDecode(responseBody)['data']['results']
        .cast<Map<String, dynamic>>();
    return parsed
        .map<Personagem>((json) =>
            Personagem.fromJson(json, 'apikey=$publicKey&hash=$hash&ts=$ts'))
        .toList();
  }

  Future<List<Personagem>> getPersonagens() async {
    final response =
        await http.get(Uri.parse('${url}apikey=$publicKey&hash=$hash&ts=$ts'));
    if (response.statusCode == 200) {
      List<Personagem> personagens = parsePersonagem(response.body);
      return personagens;
    } else {
      throw Exception('Falha ao obter informações da API');
    }
  }
}
