import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

// Generated serialization class
part 'character.g.dart';

@JsonSerializable()
class Character extends Equatable {
  const Character(
      {required this.name,
      required this.creatureType,
      required this.created,
      required this.id});

  factory Character.create(name, creatureType) {
    var created = DateTime.now();
    var id = const Uuid().v4();
    return Character(
        name: name, creatureType: creatureType, created: created, id: id);
  }

  final String name;
  final Creature creatureType;
  final DateTime created;
  final String id;

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$CharacterFromJson()` constructor.
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  /// Calls the private, generated helper method `_$CharacterToJson`.
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  Character copyWith(
      {String? name, Creature? creatureType, DateTime? created, String? id}) {
    return Character(
        name: name ?? this.name,
        creatureType: creatureType ?? this.creatureType,
        created: created ?? this.created,
        id: id ?? this.id);
  }

  @override
  List<Object> get props => [name, creatureType, created, id];
}
