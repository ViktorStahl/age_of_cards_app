import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/constants/defence.dart';
import 'package:age_of_cards_app/constants/weapon.dart';
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
      required this.id,
      required this.defences,
      required this.weapons});

  factory Character.create(name, creatureType) {
    var created = DateTime.now();
    var id = const Uuid().v4();
    return Character(
        name: name,
        creatureType: creatureType,
        created: created,
        id: id,
        defences: const {},
        weapons: const {});
  }

  final String name;
  final Creature creatureType;
  final DateTime created;
  final String id;
  final Map<String, Defence> defences;
  final Map<String, Weapon> weapons;

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$CharacterFromJson()` constructor.
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  /// Calls the private, generated helper method `_$CharacterToJson`.
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  List<Object> get props => [name, creatureType, created, id, weapons, defences];
  Character copyWith(
      {String? name,
      Creature? creatureType,
      DateTime? created,
      String? id,
      Map<String, Defence>? defences,
      Map<String, Weapon>? weapons}) {
    return Character(
        name: name ?? this.name,
        creatureType: creatureType ?? this.creatureType,
        created: created ?? this.created,
        id: id ?? this.id,
        defences: defences ?? this.defences,
        weapons: weapons ?? this.weapons);
  }

  int getTotalHealth() {
    return creatureType.health + (defences.isNotEmpty ? defences.values.map((defence) => defence.health).reduce((total, element) => total + element) : 0);
  }

  int getTotalDefence() {
    return creatureType.defence + (defences.isNotEmpty ? defences.values.map((defence) => defence.defence).reduce((total, element) => total + element) : 0);
  }
}
