import 'package:age_of_cards_app/models/character.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'character_state.dart';

class CharacterCubit extends HydratedCubit<CharacterState> {
  CharacterCubit(super.initialState);

  @override
  String get id => state.character.id;

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
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
