// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['name'] as String,
      $enumDecode(_$CreatureEnumMap, json['creatureType']),
      DateTime.parse(json['created'] as String),
      json['id'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'creatureType': _$CreatureEnumMap[instance.creatureType]!,
      'created': instance.created.toIso8601String(),
      'id': instance.id,
    };

const _$CreatureEnumMap = {
  Creature.human: 'Human',
  Creature.spectre: 'Spectre',
  Creature.orc: 'Orc',
};
