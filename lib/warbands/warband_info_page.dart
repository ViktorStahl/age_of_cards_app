import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/warbands/character.dart';
import 'package:age_of_cards_app/models/warband.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/warband_container_model.dart';

class WarbandInfoPage extends StatelessWidget {
  const WarbandInfoPage({super.key, required this.warband});

  final Warband warband;

  void _addCharacter(BuildContext context) async {
    Provider.of<WarbandContainerModel>(context, listen: false)
        .addCharacter(warband, Character.create("Kalle", Creature.human));
  }

  void _deleteCharacter(BuildContext context, Character character) async {
    Provider.of<WarbandContainerModel>(context, listen: false)
        .deleteCharacter(warband, character);
  }

  List<Widget> createCharacterCards(List<Character> characters) {
    return characters
        .map((character) =>
            CharacterCard(character: character, onDelete: _deleteCharacter))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(warband.name),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(children: [
                Center(child: Consumer<WarbandContainerModel>(
                    builder: (context, model, _) {
                  return warband.characters.isEmpty
                      ? Text("Add Character")
                      : ListView(
                          shrinkWrap: true,
                          children: createCharacterCards(warband.characters));
                })),
                IconButton(
                    onPressed: () => _addCharacter(context),
                    icon: const Icon(Icons.add)),
              ]),
            )));
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required Character character,
    void Function(BuildContext, Character)? onDelete,
  })  : _character = character,
        _onDelete = onDelete;

  final Character _character;
  final void Function(BuildContext, Character)? _onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                _character.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: Text(_character.creatureType.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                iconSize: 24.0,
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  _onDelete?.call(context, _character);
                },
              )),
        ],
      ),
    );
  }
}
