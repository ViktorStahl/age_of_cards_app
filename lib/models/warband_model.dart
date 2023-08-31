import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../warbands/character.dart';

// Generated serialization class
part 'warband_model.g.dart';

@JsonSerializable()
class WarbandModel extends ChangeNotifier {
  WarbandModel(this.name, this.faction);
  
  final String name;
  final String faction;
  List<Character> characters = [];
  final DateTime created = DateTime.now();

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$WarbandModelFromJson()` constructor.
  factory WarbandModel.fromJson(Map<String, dynamic> json) => _$WarbandModelFromJson(json);

  /// Calls the private, generated helper method `_$WarbandModelToJson`.
  Map<String, dynamic> toJson() => _$WarbandModelToJson(this);
}