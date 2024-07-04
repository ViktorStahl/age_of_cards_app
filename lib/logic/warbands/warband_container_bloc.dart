import 'package:age_of_cards_app/models/warband.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'warband_container_event.dart';
part 'warband_container_state.dart';

class WarbandContainerBloc extends Bloc<WarbandContainerEvent, WarbandContainerState> {
  WarbandContainerBloc() : super(WarbandContainerLoading()) {
    on<LoadWarbands>(_onLoadWarbands);
    on<AddWarband>(_onAddWarband);
    on<UpdateWarband>(_onUpdateWarband);
    on<DeleteWarband>(_onDeleteWarband);
  }

  void _onLoadWarbands(LoadWarbands event, Emitter<WarbandContainerState> emit){
    emit(WarbandContainerLoaded(warbands: event.warbands));
  }

  void _onAddWarband(AddWarband event, Emitter<WarbandContainerState> emit){
    emit(WarbandContainerLoaded(warbands: List.empty()));
  }

  void _onUpdateWarband(UpdateWarband event, Emitter<WarbandContainerState> emit){
    emit(WarbandContainerLoaded(warbands: List.empty()));
  }

  void _onDeleteWarband(DeleteWarband event, Emitter<WarbandContainerState> emit){
    emit(WarbandContainerLoaded(warbands: List.empty()));
  }
}
