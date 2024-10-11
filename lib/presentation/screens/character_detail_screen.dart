import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/constants/defence.dart';
import 'package:age_of_cards_app/constants/weapon.dart';
import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:age_of_cards_app/presentation/util/horizontal_or_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DropdownMenu<String>(
                            width: 240,
                            initialSelection: character.creatureType.text,
                            label: const Text('Type'),
                            dropdownMenuEntries: Creature.values
                                .map((creature) => DropdownMenuEntry(
                                    value: creature.text,
                                    label: creature.text,
                                    labelWidget: CreatureSelectionWidget(
                                        creature: creature)))
                                .toList(),
                            onSelected: (String? type) {
                              if (type == null) return;
                              context.read<CharacterCubit>().changeCreatureType(
                                  Creature.fromString(type));
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
                    Column(children: [
                      Icon(MdiIcons.gold),
                      Text('${character.creatureType.gold}'),
                    ]),
                  ],
                ),
              ),
              const HorizontalOrLine(label: 'Weapons'),
              ..._createWeaponTiles(context, character.weapons),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.read<CharacterCubit>().addWeapon(Weapon.dagger);
                },
              ),
              const HorizontalOrLine(label: 'Armour'),
              ..._createDefenceTiles(context, character.defences),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.read<CharacterCubit>().addDefence(Defence.light);
                },
              )
            ]),
          ),
        );
      },
    );
  }

  List<Widget> _createWeaponTiles(
      BuildContext context, Map<String, Weapon> weapons) {
    if (weapons.isEmpty) return const [Text('Add Weapons')];
    List<Widget> tiles = [];
    for (MapEntry<String, Weapon> entry in weapons.entries) {
      tiles.add(WeaponTile(entry: entry));
    }
    return tiles;
  }

  List<Widget> _createDefenceTiles(
      BuildContext context, Map<String, Defence> defences) {
    if (defences.isEmpty) return const [Text('Add Defences')];
    List<Widget> tiles = [];
    for (MapEntry<String, Defence> entry in defences.entries) {
      tiles.add(_createArmour(context, entry));
    }
    return tiles;
  }

  Widget _createArmour(BuildContext context, MapEntry<String, Defence> entry) {
    Defence defence = entry.value;
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
        leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Icon(MdiIcons.tshirtCrew)]),
        title: DropdownMenu<String>(
          initialSelection: defence.text,
          label: const Text('Type'),
          dropdownMenuEntries: Defence.values
              .map((w) => DropdownMenuEntry(value: w.text, label: w.text))
              .toList(),
          onSelected: (String? type) {
            if (type == null) return;
            context
                .read<CharacterCubit>()
                .updateDefence(entry.key, Defence.fromString(type));
          },
        ),
        subtitle: Column(children: [
          Row(children: _defenceInfo(defence)),
          if (defence.trait != null) _addTrait(defence.trait as String),
        ]),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            context.read<CharacterCubit>().removeDefence(entry.key);
          },
        ),
        onTap: () {},
      )
    ]));
  }

  List<Widget> _defenceInfo(Defence defence) {
    List<Widget> info = [];

    if (defence.defence > 0) {
      info.add(Column(
          children: [Icon(MdiIcons.shield), Text('${defence.defence}')]));
    }
    if (defence.health > 0) {
      info.add(
          Column(children: [Icon(MdiIcons.heart), Text('${defence.health}')]));
    }
    return info;
  }

  Widget _addTrait(String trait) {
    return Row(children: [
      Expanded(
        child: Markdown(shrinkWrap: true, data: trait),
      )
    ]);
  }
}

class CreatureSelectionWidget extends StatelessWidget {
  const CreatureSelectionWidget({super.key, required this.creature});

  final Creature creature;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          creature.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Row(children: [
          Column(children: [
            Icon(MdiIcons.heart, size: 16),
            Text('${creature.health}',
                style: Theme.of(context).textTheme.labelSmall),
          ]),
          Column(children: [
            Icon(MdiIcons.shield, size: 16),
            Text('${creature.defence}',
                style: Theme.of(context).textTheme.labelSmall),
          ]),
          Column(children: [
            Icon(MdiIcons.run, size: 16),
            Text('${creature.move}',
                style: Theme.of(context).textTheme.labelSmall),
          ]),
          Column(children: [
            Icon(MdiIcons.gold, size: 16),
            Text('${creature.gold}',
                style: Theme.of(context).textTheme.labelSmall),
          ]),
        ]),
      ],
    );
  }
}

class WeaponTile extends StatelessWidget {
  const WeaponTile({super.key, required this.entry});

  final MapEntry<String, Weapon> entry;

  @override
  Widget build(BuildContext context) {
    Weapon weapon = entry.value;
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
          leading: Icon(MdiIcons.sword),
          title: DropdownMenu<String>(
            initialSelection: weapon.text,
            label: const Text('Type'),
            dropdownMenuEntries: Weapon.values
                .map((w) => DropdownMenuEntry(value: w.text, label: w.text))
                .toList(),
            onSelected: (String? type) {
              if (type == null) return;
              context
                  .read<CharacterCubit>()
                  .updateWeapon(entry.key, Weapon.fromString(type));
            },
          ),
          subtitle: Column(children: [
            Row(children: weaponInfo(weapon)),
            Row(
              children: [Flexible(child: Text(weapon.trait ?? ''))],
            )
          ]),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<CharacterCubit>().removeWeapon(entry.key);
            },
          ),
          onTap: () {})
    ]));
  }

  static List<Widget> weaponInfo(Weapon weapon) {
    List<Widget> info = [];
    if (weapon.attacks > 0) {
      info.add(Column(
          children: [Icon(MdiIcons.autorenew), Text('${weapon.attacks}')]));
    }
    if (weapon.power > 0) {
      info.add(
          Column(children: [Icon(MdiIcons.flash), Text('${weapon.power}')]));
    }
    if (weapon.range > 1) {
      info.add(
          Column(children: [Icon(MdiIcons.bowArrow), Text('${weapon.range}')]));
    }
    if (weapon.piercing != null) {
      info.add(Column(children: [
        Icon(MdiIcons.shieldOffOutline),
        Text('${weapon.piercing}')
      ]));
    }
    if (weapon.pairing == true) {
      info.add(Column(children: [Icon(MdiIcons.swordCross), const Text('')]));
    }
    return info;
  }
}
