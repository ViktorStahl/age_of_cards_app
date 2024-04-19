import 'package:age_of_cards_app/logic/warband/warband_bloc.dart';
import 'package:age_of_cards_app/models/warband.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';

part 'warband_collection_event.dart';

class WarbandCollectionCubit
    extends HydratedCubit<Set<WarbandBloc>> {
  WarbandCollectionCubit() : super(<WarbandBloc>{});

  void addWarband(Warband warband) {
    emit(Set.from(state)..add(WarbandBloc(WarbandState(uuid: const Uuid().v4(), warband: warband))));
  }

  void deleteWarband(String warbandID) {
    emit(Set.from(state)..removeWhere((WarbandBloc warband) { return warband.state.uuid == warbandID; }));
  }
  
  @override
  Set<WarbandBloc>? fromJson(Map<String, dynamic> json) {
    final warbands = json['warbands'] as List;
    return warbands.map((warband) => WarbandBloc(WarbandState.fromJson(warband))).toSet();
  }
  
  @override
  Map<String, dynamic>? toJson(Set<WarbandBloc> state) {
    return {
      'warbands': state.map((warband) => warband.state.toJson()).toList()
    };
  }
}
