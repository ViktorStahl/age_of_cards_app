import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        Character character = state.character;
        return Scaffold(
          appBar: AppBar(
            title: Text(character.name),
          ),
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Column(children: [
                  Row(
                    children: [
                      const Text('Type:'),
                      Text('${character.creatureType}'),
                    ],
                  )
                ]),
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Edit Character',
            child: const Icon(Icons.edit),
          ),
        );
      },
    );
  }
}
