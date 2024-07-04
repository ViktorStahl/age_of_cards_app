import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

// Generated serialization class
part 'character.g.dart';

@JsonSerializable()
class Character {
  Character(this.name, this.creatureType, this.created, this.id);

  Character.create(this.name, this.creatureType) {
    created = DateTime.now();
    id = const Uuid().v4();
  }

  String name;
  final Creature creatureType;
  late final DateTime created;
  late final String id;

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$CharacterFromJson()` constructor.
  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  /// Calls the private, generated helper method `_$CharacterToJson`.
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

}