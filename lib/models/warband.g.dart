// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warband.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warband _$WarbandFromJson(Map<String, dynamic> json) => Warband(
      json['id'] as String,
      json['name'] as String,
      json['faction'] as String,
      DateTime.parse(json['created'] as String),
      (json['_characters'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WarbandToJson(Warband instance) => <String, dynamic>{
      'name': instance.name,
      'faction': instance.faction,
      '_characters': instance._characters,
      'created': instance.created.toIso8601String(),
      'id': instance.id,
    };
