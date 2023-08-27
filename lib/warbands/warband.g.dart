// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warband.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warband _$WarbandFromJson(Map<String, dynamic> json) => Warband(
      json['name'] as String,
      json['faction'] as String,
    )..characters = (json['characters'] as List<dynamic>)
        .map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$WarbandToJson(Warband instance) => <String, dynamic>{
      'name': instance.name,
      'faction': instance.faction,
      'characters': instance.characters,
    };
