import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:uuid/uuid.dart';

// Generated serialization class
part 'warband.g.dart';

@JsonSerializable(explicitToJson: true)
class Warband {
  Warband.create(this.name, this.faction) {
    created = DateTime.now();
    id = const Uuid().v4();
  }

  Warband(
      {required this.name,
      required this.faction,
      required this.characters,
      required this.created,
      required this.id});

  String name;
  late final String faction;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  Set<CharacterCubit> characters = {};
  late final DateTime created;
  late final String id;

  static Set<CharacterCubit> _fromJson(List<dynamic> json) {
    return json
        .map((character) => CharacterCubit(CharacterState.fromJson(character)))
        .toSet();
  }

  static List<dynamic> _toJson(Set<CharacterCubit> cubits) {
    return cubits.map((cubit) => cubit.state.toJson()).toList();
  }

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$CharacterFromJson()` constructor.
  factory Warband.fromJson(Map<String, dynamic> json) {
      return _$WarbandFromJson(json);
  }

  /// Calls the private, generated helper method `_$CharacterToJson`.
  Map<String, dynamic> toJson() => _$WarbandToJson(this);

  void addCharacter(CharacterCubit character) {
    characters.add(character);
  }

  void setName(String name) {
    this.name = name;
  }

  Warband copyWith(
      {String? name,
      String? faction,
      Set<CharacterCubit>? characters,
      DateTime? created,
      String? id}) {
    return Warband(
        name: name ?? this.name,
        faction: faction ?? this.faction,
        characters: characters ?? this.characters,
        created: created ?? this.created,
        id: id ?? this.id);
  }
}
