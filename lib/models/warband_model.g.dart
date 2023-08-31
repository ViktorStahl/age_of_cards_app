// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warband_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarbandModel _$WarbandModelFromJson(Map<String, dynamic> json) => WarbandModel(
      json['name'] as String,
      json['faction'] as String,
    )..characters = (json['characters'] as List<dynamic>)
        .map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$WarbandModelToJson(WarbandModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'faction': instance.faction,
      'characters': instance.characters,
    };
