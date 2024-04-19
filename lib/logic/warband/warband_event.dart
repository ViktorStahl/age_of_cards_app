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

class UpdateWarband extends WarbandEvent {
  final Warband warband;

  const UpdateWarband(this.warband);

  @override
  List<Object> get props => [warband];
}
