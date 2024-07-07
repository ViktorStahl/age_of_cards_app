part of 'warband_collection_cubit.dart';

@immutable
sealed class WarbandCollectionEvent extends Equatable {
  const WarbandCollectionEvent();

  @override
  List<Object> get props => [];
}

class LoadWarbands extends WarbandCollectionEvent {
  final List<String> warbandIDs;

  const LoadWarbands({this.warbandIDs = const <String>[]});

  @override
  List<Object> get props => [warbandIDs];
}

class AddWarband extends WarbandCollectionEvent {
  final Warband warband;

  const AddWarband({required this.warband});

  @override
  List<Object> get props => [warband];
}

class DeleteWarband extends WarbandCollectionEvent {
  final String warbandID;

  const DeleteWarband({required this.warbandID});

  @override
  List<Object> get props => [warbandID];
}
