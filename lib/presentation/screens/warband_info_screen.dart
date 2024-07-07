import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:age_of_cards_app/logic/warband/warband_bloc.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class WarbandInfoScreen extends StatelessWidget {
  const WarbandInfoScreen({super.key});

  void _addCharacter(BuildContext context) async {
    context.read<WarbandBloc>().add(AddCharacter(Character(
        name: 'Pelle',
        creatureType: Creature.human,
        created: DateTime.now(),
        id: const Uuid().v4())));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarbandBloc, WarbandState>(
      builder: (context, state) {
        var characterList = state.warband.characters.toList();
        return Scaffold(
            appBar: AppBar(
              title: Text(state.warband.name),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Column(children: [
                    Center(
                        child: characterList.isEmpty
                            ? const Text('Add Character')
                            : ListView.builder(
                                itemCount: characterList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final characterCubit = characterList[index];
                                  return BlocProvider(
                                    create: (context) => characterCubit,
                                    child: const CharacterCard(),
                                  );
                                })),
                    IconButton(
                        onPressed: () => _addCharacter(context),
                        icon: const Icon(Icons.add)),
                  ]),
                )));
      },
    );
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) {
            final character = state.character;
            return ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  character.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(character.creatureType.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  iconSize: 24.0,
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () {},
                ));
          }),
        ],
      ),
    );
  }
}
