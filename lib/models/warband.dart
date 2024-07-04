import 'package:json_annotation/json_annotation.dart';

import 'character.dart';
import 'package:uuid/uuid.dart';


// Generated serialization class
part 'warband.g.dart';

@JsonSerializable()
class Warband {
  Warband.create(this.name, this.faction) {
    created = DateTime.now();
    id = const Uuid().v4();
  }

  Warband(this.id, this.name, this.faction, this.created, this._characters);

  String name;
  late final String faction;
  @JsonKey(includeFromJson: true, includeToJson: true)
  List<String> _characters = [];
  late final DateTime created;
  late final String id;

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$CharacterFromJson()` constructor.
  factory Warband.fromJson(Map<String, dynamic> json) =>
      _$WarbandFromJson(json);

  /// Calls the private, generated helper method `_$CharacterToJson`.
  Map<String, dynamic> toJson() => _$WarbandToJson(this);

  void addCharacter(String characterID) {
    _characters.add(characterID);
  }

  void setName(String name) {
    this.name = name;
  }

  List<String> get characters => _characters;

  List<String> getCharacterList() {
    return _characters;
  }
}
