part of 'warband_bloc.dart';

class WarbandState extends Equatable {
  final Warband warband;
  final String uuid;

  const WarbandState({required this.uuid, required this. warband});

  @override
  List<Object> get props => [uuid, warband];

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'warband': warband.toJson(),
    };
  }

  static WarbandState fromJson(Map<String, dynamic> json) {
    return WarbandState(
      uuid: json['uuid'],
      warband: Warband.fromJson(json['warband']),
    );
  }
}
