import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      DropdownMenu<String>(
                        initialSelection: character.creatureType.text,
                        label: const Text('Type'),
                        dropdownMenuEntries: Creature.values
                            .map((creature) => DropdownMenuEntry(
                                value: creature.text, label: creature.text))
                            .toList(),
                        onSelected: (String? type) {
                          if (type == null) return;
                          context
                              .read<CharacterCubit>()
                              .changeCreatureType(Creature.fromString(type));
                        },
                      ),
                    ]),
                    Column(children: [
                      Icon(MdiIcons.heart),
                      Text('${character.creatureType.health}'),
                    ]),
                    Column(children: [
                      Icon(MdiIcons.shield),
                      Text('${character.creatureType.defence}'),
                    ]),
                    Column(children: [
                      Icon(MdiIcons.run),
                      Text('${character.creatureType.move}'),
                    ]),
                  ],
                ),
                ListTile(
                  leading: Icon(MdiIcons.sword),
                  title: const Text('Dagger'),
                  subtitle: Row(children: [
                    Column(children: [
                      Icon(MdiIcons.speedometer),
                      const Text('3')
                    ]),
                    Column(children: [Icon(MdiIcons.power), const Text('2')]),
                  ]),
                  onTap: () {},
                ),
              ]),
            ),
          ),
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
