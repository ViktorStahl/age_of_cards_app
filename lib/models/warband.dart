import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:uuid/uuid.dart';

// Generated serialization class
part 'warband.g.dart';

@JsonSerializable(explicitToJson: true)
class Warband extends Equatable {
  factory Warband.create(name, faction) {
    var created = DateTime.now();
    var id = const Uuid().v4();
    return Warband(
        name: name,
        faction: faction,
        characters: const {},
        created: created,
        id: id);
  }

  const Warband(
      {required this.name,
      required this.faction,
      required this.characters,
      required this.created,
      required this.id});

  final String name;
  final String faction;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final Set<CharacterCubit> characters;
  final DateTime created;
  final String id;

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

  @override
  List<Object> get props => [name, faction, characters, created, id];
}
