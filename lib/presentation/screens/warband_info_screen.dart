import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/constants/weapon.dart';
import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:age_of_cards_app/logic/warband/warband_bloc.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:age_of_cards_app/presentation/screens/character_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
                                  return BlocProvider<CharacterCubit>.value(
                                    value: characterCubit,
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
    return GestureDetector(
      onTap: () => _openCharacterDetailScreen(context),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) {
                final character = state.character;
                return ListTile(
                    title: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          child: const Icon(Icons.person)),
                      Text(
                        character.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ]),
                    subtitle: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text('${character.creatureType}'),
                          ]),
                          Column(children: [
                            Icon(MdiIcons.heart),
                            Text('${character.getTotalHealth()}'),
                          ]),
                          Column(children: [
                            Icon(MdiIcons.shield),
                            Text('${character.getTotalDefence()}'),
                          ]),
                          Column(children: [
                            Icon(MdiIcons.run),
                            Text('${character.creatureType.move}'),
                          ]),
                        ],
                      ),
                      DataTable(
                          columnSpacing: 8,
                          headingRowHeight: 0,
                          columns: [
                            DataColumn(label: Container()),
                            DataColumn(label: Container())
                          ],
                          rows: character.weapons.values.map((Weapon weapon) {
                            return DataRow(cells: [
                              DataCell(Text(weapon.text,
                                  style:
                                      Theme.of(context).textTheme.bodyLarge)),
                              DataCell(WeaponInfo(weapon: weapon))
                            ]);
                          }).toList())
                    ]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      iconSize: 24.0,
                      color: Theme.of(context).iconTheme.color,
                      onPressed: () {
                        _onDelete(context, character);
                      },
                    ));
              },
            )
          ],
        ),
      ),
    );
  }

  _openCharacterDetailScreen(BuildContext originalContext) async {
    await Navigator.of(originalContext).push(MaterialPageRoute(
        builder: (newContext) => BlocProvider<CharacterCubit>.value(
              value: originalContext.read<CharacterCubit>(),
              child: const CharacterDetailScreen(),
            )));
  }

  void _onDelete(BuildContext context, Character character) {
    BlocProvider.of<WarbandBloc>(context).add(DeleteCharacter(character.id));
  }
}

class WeaponInfo extends StatelessWidget {
  const WeaponInfo({super.key, required this.weapon});

  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [...WeaponTile.weaponInfo(weapon)],
    );
  }
}
