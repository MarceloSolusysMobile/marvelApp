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
  PersonagemApi api = PersonagemApi();

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Listagem de Personagens'),
      ),
      body: FutureBuilder<List<Personagem>>(
          future: api.getPersonagens(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          snapshot.data![index].avatar,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              onPressed: () {
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
