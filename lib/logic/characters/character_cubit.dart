import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/constants/defence.dart';
import 'package:age_of_cards_app/constants/weapon.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';

part 'character_state.dart';

class CharacterCubit extends HydratedCubit<CharacterState> {
  CharacterCubit(super.initialState);

  @override
  String get id => state.character.id;

  changeCreatureType(Creature type) {
    emit(state.copyWith(
        character: state.character.copyWith(creatureType: type)));
  }

  changeName(String name) {
    emit(state.copyWith(
        character: state.character.copyWith(name: name)));
  }

  addWeapon(Weapon weapon) {
    String uuid = const Uuid().v4();
    updateWeapon(uuid, weapon);
  }

  updateWeapon(String uuid, Weapon weapon) {
    var newWeapons = Map.of(state.character.weapons);
    newWeapons[uuid] = weapon;
    var newState = state.copyWith(
        character: state.character
            .copyWith(weapons: newWeapons));
    emit(newState);
  }

  removeWeapon(String uuid) {
    var newState = state.copyWith(
        character: state.character
            .copyWith(weapons: Map.of(state.character.weapons)..removeWhere((key, value) => key == uuid)));
    emit(newState);
  }

  addDefence(Defence defence) {
    String uuid = const Uuid().v4();
    updateDefence(uuid, defence);
  }

  updateDefence(String uuid, Defence defence) {
    var newDefences = Map.of(state.character.defences);
    newDefences[uuid] = defence;
    var newState = state.copyWith(
        character: state.character
            .copyWith(defences: newDefences));
    emit(newState);
  }

  removeDefence(String uuid) {
    var newState = state.copyWith(
        character: state.character
            .copyWith(defences: Map.of(state.character.defences)..removeWhere((key, value) => key == uuid)));
    emit(newState);
  }

  @override
  CharacterState? fromJson(Map<String, dynamic> json) {
    return CharacterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CharacterState state) {
    return state.toJson();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('$error, $stackTrace');
    }
    super.onError(error, stackTrace);
  }
}
