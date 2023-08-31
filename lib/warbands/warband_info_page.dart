import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/warbands/character.dart';
import 'package:age_of_cards_app/models/warband_model.dart';
import 'package:flutter/material.dart';

class WarbandInfoPage extends StatefulWidget {
  const WarbandInfoPage({super.key, required this.warband});

  final WarbandModel warband;

  @override
  State<WarbandInfoPage> createState() => _WarbandInfoPageState();
}

class _WarbandInfoPageState extends State<WarbandInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  void _addCharacter(BuildContext context) async {
    widget.warband.characters.add(Character("Kalle", Creature.human));
    setState(() {});
  }

  void _deleteCharacter(Character character) async {
    widget.warband.characters.remove(character);
    setState(() {});
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
          title: Text(widget.warband.name),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(children: [
                Center(
                    child: widget.warband.characters.isEmpty
                        ? Text("Add Character")
                        : ListView(
                            shrinkWrap: true,
                            children: createCharacterCards(
                                widget.warband.characters))),
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
    void Function(Character)? onDelete,
  })  : _character = character,
        _onDelete = onDelete;

  final Character _character;
  final void Function(Character)? _onDelete;

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
                  _onDelete?.call(_character);
                },
              )),
        ],
      ),
    );
  }
}
