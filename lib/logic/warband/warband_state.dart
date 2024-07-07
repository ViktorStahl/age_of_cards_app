part of 'warband_bloc.dart';

class WarbandState extends Equatable {
  final Warband warband;

  const WarbandState({required this.warband});

  @override
  List<Object> get props => [warband];

  Map<String, dynamic> toJson() {
    return warband.toJson();
  }

  static WarbandState fromJson(Map<String, dynamic> json) {
    return WarbandState(warband: Warband.fromJson(json));
  }

  WarbandState copyWith({Warband? warband}) {
    return WarbandState(warband: warband ?? this.warband);
  }
}
