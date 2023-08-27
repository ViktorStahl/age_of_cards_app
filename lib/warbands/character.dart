import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:json_annotation/json_annotation.dart';

// Generated serialization class
part 'character.g.dart';

@JsonSerializable()
class Character {
  Character(this.name, this.creatureType);

  final String name;
  final Creature creatureType;
  final DateTime created = DateTime.now();

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$CharacterFromJson()` constructor.
  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  /// Calls the private, generated helper method `_$CharacterToJson`.
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}