import 'package:flutter/material.dart';
import '../model/personagem.dart';
// Classe que representa a tela de detalhes de um personagem
class DetalhesPersonagem extends StatefulWidget {
  final Personagem personagem;  // O personagem a ser exibido
  const DetalhesPersonagem({super.key, required this.personagem});  
  @override
  State<DetalhesPersonagem> createState() => _DetalhesPersonagemState();
}
class _DetalhesPersonagemState extends State<DetalhesPersonagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Personagem ${widget.personagem.name}'),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                // Exibindo a imagem do personagem
                Image.network(
                  widget.personagem.avatar,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // Exibindo o nome do personagem
                  child: Text(
                    widget.personagem.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
