import 'package:json_annotation/json_annotation.dart';

// Generated serialization class
part 'warband.g.dart';

@JsonSerializable()
class Warband {
  Warband(this.name, this.faction);
  
  final String name;
  final String faction;
  final DateTime created = DateTime.now();

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$WarbandFromJson()` constructor.
  factory Warband.fromJson(Map<String, dynamic> json) => _$WarbandFromJson(json);

  /// Calls the private, generated helper method `_$WarbandToJson`.
  Map<String, dynamic> toJson() => _$WarbandToJson(this);
}