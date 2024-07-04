part of 'warband_container_bloc.dart';

@immutable
sealed class WarbandContainerEvent extends Equatable {
  const WarbandContainerEvent();

  @override
  List<Object> get props => [];
}

class LoadWarbands extends WarbandContainerEvent {
  final List<Warband> warbands;

  const LoadWarbands({this.warbands = const <Warband>[]});

  @override
  List<Object> get props => [warbands];
}

class AddWarband extends WarbandContainerEvent {
  final Warband warband;

  const AddWarband({required this.warband});

  @override
  List<Object> get props => [warband];
}

class UpdateWarband extends WarbandContainerEvent {
  final Warband warband;

  const UpdateWarband({required this.warband});

  @override
  List<Object> get props => [warband];
  }

class DeleteWarband extends WarbandContainerEvent {
  final Warband warband;

  const DeleteWarband({required this.warband});

  @override
  List<Object> get props => [warband];
}
