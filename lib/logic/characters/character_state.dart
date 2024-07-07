part of 'character_cubit.dart';

class CharacterState extends Equatable {
  final Character character;

  const CharacterState({required this.character});

  @override
  List<Object> get props => [character];

  Map<String, dynamic> toJson() => character.toJson();

  factory CharacterState.fromJson(Map<String, dynamic> json) =>
      CharacterState(character: Character.fromJson(json));

  CharacterState copyWith({Character? character}) {
    return CharacterState(character: character ?? this.character);
  }
}
