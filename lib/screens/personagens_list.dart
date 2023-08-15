import 'package:flutter/material.dart';
import '../http/personagem_api.dart';
import '../model/personagem.dart';
import 'detalhes_personagem.dart';

class PersagensList extends StatefulWidget {
  const PersagensList({super.key});

  @override
  State<PersagensList> createState() => _PersagensListState();
}

class _PersagensListState extends State<PersagensList> {
  // Criando uma instância da classe PersonagemApi para fazer chamadas à API
  PersonagemApi api = PersonagemApi();

  // Função para navegar para a tela de detalhes do personagem
  navegarDetalhesPersonagem(Personagem personagem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesPersonagem(
          personagem: personagem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Definindo a barra superior da tela
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Listagem de Personagens'),
      ),
      // Definindo o corpo da tela
      body: FutureBuilder<List<Personagem>>(
          // Chamando a função da API para obter a lista de personagens no futuro
          future: api.getPersonagens(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            // Verificando se os dados da API foram recebidos com sucesso
            if (snapshot.hasData) {
              // Construindo uma grade (grid) de personagens
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: data!.length,
                // Construindo os cards para cada personagem
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        // Exibindo a imagem do personagem
                        Image.network(
                          snapshot.data![index].avatar,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          // Adicionando um botão de texto com o nome do personagem
                          child: TextButton(
                              onPressed: () {
                                // Navegando para a tela de detalhes do personagem
                                navegarDetalhesPersonagem(
                                    snapshot.data![index]);
                              },
                              child: Text(
                                snapshot.data![index].name,
                                style: const TextStyle(fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              // Exibindo um indicador de carregamento enquanto os dados da API são buscados
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
