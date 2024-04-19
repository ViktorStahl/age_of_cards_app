import 'dart:collection';

import 'package:age_of_cards_app/models/warband.dart';
import 'package:age_of_cards_app/warbands/character.dart';
import 'package:flutter/foundation.dart';
import 'package:localstore/localstore.dart';

class WarbandContainerModel extends ChangeNotifier {
  late final Localstore storage;
  List<Warband> _warbands = [];

  UnmodifiableListView<Warband> get warbands =>
      UnmodifiableListView(_warbands);

  WarbandContainerModel() {
    storage = Localstore.getInstance(useSupportDir: true);
    readData();
  }

  void readData() async {
    await storage
        .collection("warbands")
        .stream
        .forEach((warband) {
      _warbands.add(Warband.fromJson(warband));
    });
    notifyListeners();
  }

  void addWarband(Warband warband) {
    _warbands.add(warband);
    notifyListeners();
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
  }

  void deleteWarband(Warband warband) {
    _warbands.remove(warband);
    notifyListeners();
    storage.collection("warbands").doc(warband.id).delete();
  }

  void changeWarbandName(Warband warband, String name) {
    final _warband = _warbands[_warbands.indexOf(warband)];
    _warband.setName(name);
    notifyListeners();
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
  }

  void changeCharacterName(Character character, String name) {
    final warband = _warbands.firstWhere((warband) => warband.characters.contains(character));
    var characterList = warband.getCharacterList();
    Character updateableCharacter = characterList[characterList.indexOf(character)];
    updateableCharacter.name = name;
    notifyListeners();
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
  }

  void addCharacter(Warband warband, Character character) {
    final warbandModifiable = _warbands[_warbands.indexOf(warband)];
    warbandModifiable.getCharacterList().add(character);
    notifyListeners();
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
  }

  void deleteCharacter(Warband warband, Character character) {
    warband.getCharacterList().remove(character);
    notifyListeners();
    storage.collection("warbands").doc(warband.id).set(warband.toJson());
  }
}
