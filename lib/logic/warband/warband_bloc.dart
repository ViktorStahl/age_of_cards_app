import 'package:age_of_cards_app/logic/characters/character_cubit.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:age_of_cards_app/models/warband.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'warband_event.dart';
part 'warband_state.dart';

class WarbandBloc extends HydratedBloc<WarbandEvent, WarbandState> {
  WarbandBloc(super.initialState) {
    on<UpdateWarband>(_onUpdateWarband);
    on<AddCharacter>(_onAddCharacter);
    on<DeleteCharacter>(_onDeleteCharacter);
  }

  void _onUpdateWarband(UpdateWarband event, Emitter<WarbandState> emit) {
    emit(WarbandState(warband: event.warband));
  }

  void _onAddCharacter(AddCharacter event, Emitter<WarbandState> emit) {
    CharacterCubit characterCubit =
        CharacterCubit(CharacterState(character: event.character));
    emit(state.copyWith(
        warband: state.warband.copyWith(
            characters: {...state.warband.characters, characterCubit})));
  }

  void _onDeleteCharacter(DeleteCharacter event, Emitter<WarbandState> emit) {
    emit(state.copyWith(
        warband: state.warband.copyWith(
            characters: Set.from(state.warband.characters)
              ..removeWhere(
                  (cubit) => cubit.state.character.id == event.characterID))));
  }

  @override
  String get id => state.warband.id;

  @override
  WarbandState? fromJson(Map<String, dynamic> json) {
    return WarbandState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(WarbandState state) {
    return state.toJson();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
