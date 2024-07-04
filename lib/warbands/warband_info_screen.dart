import 'package:age_of_cards_app/error/app_exception.dart';
import 'package:age_of_cards_app/logic/characters/character_bloc.dart';
import 'package:age_of_cards_app/logic/warbands/warband_container_bloc.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:age_of_cards_app/models/warband.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarbandInfoScreen extends StatelessWidget {
  const WarbandInfoScreen({super.key, required this.warbandID});

  final String warbandID;

  void _addCharacter(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    final warband =
        getWarbandFromId(context.read<WarbandContainerBloc>().state, warbandID);

    return Scaffold(
        appBar: AppBar(
          title: Text(warband.name),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(children: [
                Center(
                    child: warband.characters.isEmpty
                        ? const Text("Add Character")
                        : ListView.builder(
                            itemCount: warband.characters.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final characterID = warband.characters[index];
                              return BlocProvider(
                                create: (context) => CharacterBloc()
                                  ..add(LoadCharacter(characterID)),
                                child: CharacterCard(characterId: characterID),
                              );
                            })),
                IconButton(
                    onPressed: () => _addCharacter(context),
                    icon: const Icon(Icons.add)),
              ]),
            )));
  }

  Warband getWarbandFromId(WarbandContainerState state, String id) {
    if (state is WarbandContainerLoaded) {
      return state.warbands.firstWhere((w) => w.id == id);
    }
    throw AppException("warband with ID $id doesn't exist");
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.characterId,
    void Function(BuildContext, Character)? onDelete,
  }) : _onDelete = onDelete;

  final String characterId;
  final void Function(BuildContext, Character)? _onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BlocBuilder<CharacterBloc, CharacterState>(builder: (context, state) {
            if (state is CharacterInitial) {
              return const ListTile(title: Text('Loading...'));
            } else if (state is CharacterLoaded) {
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
                    onPressed: () {
                      _onDelete?.call(context, character);
                    },
                  ));
            } else {
              return const Text("Something went wrong.");
            }
          }),
        ],
      ),
    );
  }
}
