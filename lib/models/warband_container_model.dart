import 'dart:collection';

import 'package:age_of_cards_app/models/warband_model.dart';
import 'package:age_of_cards_app/warband_storage.dart';
import 'package:age_of_cards_app/models/warband_container.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

class WarbandContainerModel extends ChangeNotifier {

  @JsonKey(includeFromJson: false, includeToJson: false)
  WarbandStorage storage;

  WarbandContainer _container = WarbandContainer();
  UnmodifiableListView<WarbandModel> get warbands => UnmodifiableListView(_container.warbands);

  void addWarband(WarbandModel warband) {
    _container.warbands.add(warband);
    notifyListeners();
    storage.writeWarbands(_container);
  }

  void deleteWarband(WarbandModel task) {
    _container.warbands.remove(task);
    notifyListeners();
    storage.writeWarbands(_container);
  }

  WarbandContainerModel(this.storage) {
    readData();
  }

  void readData() async {
    _container = await storage.readWarbands();
    notifyListeners();
  }
}
