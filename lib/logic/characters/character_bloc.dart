import 'package:age_of_cards_app/constants/creatures.dart';
import 'package:age_of_cards_app/models/character.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends HydratedBloc<CharacterEvent, CharacterState> {
  final String characterID;
  CharacterBloc(this.characterID) : super(CharacterInitial()) {
    on<LoadCharacter>(_onLoadCharacter);
  }

  void _onLoadCharacter(LoadCharacter event, Emitter<CharacterState> emit) {
    Character character =
        Character('Pelle', Creature.human, DateTime.now(), event.characterID);
    emit(CharacterLoaded(character));
  }

  @override
  String get id => characterID;

  @override
  CharacterState? fromJson(Map<String, dynamic> json) {
    // TODO: Error handling
    return CharacterLoaded(Character.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(CharacterState state) {
    if (state is CharacterLoaded) {
      return state.character.toJson();
    } else {
      return null;
    }
  }
}
