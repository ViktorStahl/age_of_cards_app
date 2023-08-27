// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['name'] as String,
      $enumDecode(_$CreatureEnumMap, json['creatureType']),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'creatureType': _$CreatureEnumMap[instance.creatureType]!,
    };

const _$CreatureEnumMap = {
  Creature.human: 'human',
  Creature.spectre: 'spectre',
  Creature.orc: 'orc',
};
