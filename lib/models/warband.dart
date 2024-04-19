import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
import 'package:localstore/localstore.dart';

import '../warbands/character.dart';

// Generated serialization class
part 'warband.g.dart';

@JsonSerializable()
class Warband {
  Warband.create(this.name, this.faction) {
    created = DateTime.now();
    final db = Localstore.instance;
    id = db.collection("warbands").doc().id;
  }

  Warband(this.id, this.name, this.faction, this.created, this._characters);

  String name;
  late final String faction;
  @JsonKey(includeFromJson: true, includeToJson: true)
  List<Character> _characters = [];
  late final DateTime created;
  late final String id;

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$CharacterFromJson()` constructor.
  factory Warband.fromJson(Map<String, dynamic> json) => _$WarbandFromJson(json);

  /// Calls the private, generated helper method `_$CharacterToJson`.
  Map<String, dynamic> toJson() => _$WarbandToJson(this);

  void addCharacter(Character character) {
    _characters.add(character);
  }

  /*factory Warband.fromMap(Map<String, dynamic> map) {
    List<Character> characters = [];
    List.castFrom(map["characters"]).forEach((character) {
      characters.add(Character.fromMap(character));
    });
    return Warband.import(
      map["id"],
      map["name"],
      map["faction"],
      map["created"],
      characters
    );
  }*/

  void setName(String name) {
    this.name = name;
  }

  UnmodifiableListView<Character> get characters =>
      UnmodifiableListView(_characters);

  List<Character> getCharacterList() {
    return _characters;
  }
}
