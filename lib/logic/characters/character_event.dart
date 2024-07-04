part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacter extends CharacterEvent {
  final String characterId;
  const LoadCharacter(this.characterId);

  @override
  List<Object> get props => [characterId];
}
