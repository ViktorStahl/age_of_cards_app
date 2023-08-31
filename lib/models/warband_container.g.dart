// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warband_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarbandContainer _$WarbandContainerFromJson(Map<String, dynamic> json) =>
    WarbandContainer()
      ..warbands = (json['warbands'] as List<dynamic>)
          .map((e) => WarbandModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WarbandContainerToJson(WarbandContainer instance) =>
    <String, dynamic>{
      'warbands': instance.warbands,
    };
