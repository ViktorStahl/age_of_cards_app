// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      name: json['name'] as String,
      creatureType: $enumDecode(_$CreatureEnumMap, json['creatureType']),
      created: DateTime.parse(json['created'] as String),
      id: json['id'] as String,
      defences: (json['defences'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, $enumDecode(_$DefenceEnumMap, e)),
      ),
      weapons: (json['weapons'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, $enumDecode(_$WeaponEnumMap, e)),
      ),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'creatureType': _$CreatureEnumMap[instance.creatureType]!,
      'created': instance.created.toIso8601String(),
      'id': instance.id,
      'defences':
          instance.defences.map((k, e) => MapEntry(k, _$DefenceEnumMap[e]!)),
      'weapons':
          instance.weapons.map((k, e) => MapEntry(k, _$WeaponEnumMap[e]!)),
    };

const _$CreatureEnumMap = {
  Creature.human: 'Human',
  Creature.spectre: 'Spectre',
  Creature.orc: 'Orc',
};

const _$DefenceEnumMap = {
  Defence.light: 'Light Armour',
  Defence.heavy: 'Heavy Armour',
  Defence.shield: 'Shield',
  Defence.towerShield: 'Tower Shield',
};

const _$WeaponEnumMap = {
  Weapon.dagger: 'Dagger',
  Weapon.oneHanded: 'One-Handed',
  Weapon.twoHanded: 'Two-Handed',
  Weapon.spear: 'Spear',
  Weapon.halberd: 'Halberd',
  Weapon.bow: 'Bow',
  Weapon.crossbow: 'Crossbow',
  Weapon.musket: 'Musket',
  Weapon.longRifle: 'Long Rifle',
  Weapon.pistol: 'Pistol',
  Weapon.spinGun: 'Spin Gun',
  Weapon.trollbane: 'Trollbane',
};
