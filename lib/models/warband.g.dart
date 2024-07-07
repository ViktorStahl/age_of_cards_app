// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warband.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warband _$WarbandFromJson(Map<String, dynamic> json) => Warband(
      name: json['name'] as String,
      faction: json['faction'] as String,
      characters: Warband._fromJson(json['characters'] as List),
      created: DateTime.parse(json['created'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$WarbandToJson(Warband instance) => <String, dynamic>{
      'name': instance.name,
      'faction': instance.faction,
      'characters': Warband._toJson(instance.characters),
      'created': instance.created.toIso8601String(),
      'id': instance.id,
    };
