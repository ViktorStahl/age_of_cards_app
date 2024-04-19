part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacter extends CharacterEvent {
  final String characterID;
  const LoadCharacter(this.characterID);

  @override
  List<Object> get props => [characterID];
}

class UpdateCharacter extends CharacterEvent {
  final Character character;
  const UpdateCharacter(this.character);

  @override
  List<Object> get props => [character];
}

class DeleteCharacter extends CharacterEvent {
  final String characterID;
  const DeleteCharacter(this.characterID);

  @override
  List<Object> get props => [characterID];
}
