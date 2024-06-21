part of 'warband_container_bloc.dart';

@immutable
sealed class WarbandContainerState extends Equatable {
  const WarbandContainerState();

  @override get props => [];
}

final class WarbandContainerLoading extends WarbandContainerState {}

final class WarbandContainerLoaded extends WarbandContainerState {
  final List<Warband> warbands;

  const WarbandContainerLoaded({this.warbands = const <Warband>[]});

  @override get props => [warbands];
}
