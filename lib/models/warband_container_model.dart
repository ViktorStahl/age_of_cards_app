import 'package:age_of_cards_app/models/warband.dart';
import 'package:age_of_cards_app/warbands/character.dart';
import 'package:flutter/foundation.dart';
import 'package:localstore/localstore.dart';

class WarbandContainerModel extends ChangeNotifier {
  final Localstore storage = Localstore.getInstance(useSupportDir: true);
  final List<Warband> _warbands = [];

  //TODO: Should be UnmodifiableListView but won't update correctly
  List<Warband> get warbands => _warbands;

  WarbandContainerModel() {
    readData();
  }

  void readData() async {
    await storage.collection("warbands").stream.forEach((warband) {
      try {
        _warbands.add(Warband.fromJson(warband));
      } catch (e) {
        print(e);
        storage.collection("warbands").doc(warband["id"]).delete();
      }
    });
    notifyListeners();
  }

  void addWarband(Warband warband) {
    _warbands.add(warband);
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
    notifyListeners();
  }

  void deleteWarband(Warband warband) {
    _warbands.remove(warband);
    storage.collection("warbands").doc(warband.id).delete();
    notifyListeners();
  }

  void changeWarbandName(Warband warband, String name) {
    final _warband = _warbands[_warbands.indexOf(warband)];
    _warband.setName(name);
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
    notifyListeners();
  }

  void changeCharacterName(Character character, String name) {
    final warband = _warbands
        .firstWhere((warband) => warband.characters.contains(character));
    var characterList = warband.getCharacterList();
    Character updateableCharacter =
        characterList[characterList.indexOf(character)];
    updateableCharacter.name = name;
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
    notifyListeners();
  }

  void addCharacter(Warband warband, Character character) {
    //final warbandModifiable = _warbands[_warbands.indexOf(warband)];
    //warbandModifiable.getCharacterList().add(character);
    warband.characters.add(character);
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
    notifyListeners();
  }

  void deleteCharacter(Warband warband, Character character) {
    warband.characters.remove(character);
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
    notifyListeners();
  }
}
