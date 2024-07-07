part of 'warband_bloc.dart';

sealed class WarbandEvent extends Equatable {
  const WarbandEvent();

  @override
  List<Object> get props => [];
}

class AddCharacter extends WarbandEvent {
  final Character character;

  const AddCharacter(this.character);

  @override
  List<Object> get props => [character];
}

class DeleteCharacter extends WarbandEvent {
  final String characterID;

  const DeleteCharacter(this.characterID);

  @override
  List<Object> get props => [characterID];
}

class UpdateWarband extends WarbandEvent {
  final Warband warband;

  const UpdateWarband(this.warband);

  @override
  List<Object> get props => [warband];
}
