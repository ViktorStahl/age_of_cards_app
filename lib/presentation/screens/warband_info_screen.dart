import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:age_of_cards_app/logic/warband/warband_bloc.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:age_of_cards_app/presentation/screens/character_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_name_generator/random_name_generator.dart';

class WarbandInfoScreen extends StatelessWidget {
  const WarbandInfoScreen({super.key});

  void _addCharacter(BuildContext context) async {
    var randomName = RandomNames(Zone.france).fullName();
    context
        .read<WarbandBloc>()
        .add(AddCharacter(Character.create(randomName, Creature.human)));
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
                                  return CharacterCard(characterCubit: characterCubit);
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
  const CharacterCard({super.key, required this.characterCubit});

  final CharacterCubit characterCubit;

  @override
  Widget build(BuildContext context) {
    final character = characterCubit.state.character;
    return GestureDetector(
      onTap: () => _openCharacterDetailScreen(context),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
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
                  onPressed: () {
                    _onDelete(context, character);
                  },
                ))
          ],
        ),
      ),
    );
  }

  _openCharacterDetailScreen(BuildContext originalContext) async {
    await Navigator.of(originalContext).push(MaterialPageRoute(
        builder: (newContext) => BlocProvider<CharacterCubit>.value(
              value: characterCubit,
              child: const CharacterDetailScreen(),
            )));
  }

  void _onDelete(BuildContext context, Character character) {
    context.read<WarbandBloc>().add(DeleteCharacter(character.id));
  }
}
