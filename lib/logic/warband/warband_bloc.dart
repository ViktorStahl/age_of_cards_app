import 'package:age_of_cards_app/models/character.dart';
import 'package:age_of_cards_app/models/warband.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'warband_event.dart';
part 'warband_state.dart';

class WarbandBloc extends HydratedBloc<WarbandEvent, WarbandState> {
  WarbandBloc(super.initialState) {
    on<UpdateWarband>(_onUpdateWarband);
  }

  void _onUpdateWarband(UpdateWarband event, Emitter<WarbandState> emit) {
    emit(WarbandState(uuid: state.uuid, warband: event.warband));
  }

  @override
  String get id => state.uuid;
  
  @override
  WarbandState? fromJson(Map<String, dynamic> json) {
    return WarbandState.fromJson(json);
  }
  
  @override
  Map<String, dynamic>? toJson(WarbandState state) {
    return state.toJson();
  }
}
