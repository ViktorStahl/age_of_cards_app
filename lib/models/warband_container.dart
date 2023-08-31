import 'package:age_of_cards_app/models/warband_model.dart';
import 'package:json_annotation/json_annotation.dart';

// Generated serialization class
part 'warband_container.g.dart';

@JsonSerializable()
class WarbandContainer {
  WarbandContainer();
  List<WarbandModel> warbands = [];

  /// Factory constructor for creating new instances from JSON Maps
  /// using the generated `_$WarbandContainerFromJson()` constructor.
  factory WarbandContainer.fromJson(Map<String, dynamic> json) => _$WarbandContainerFromJson(json);

  /// Calls the private, generated helper method `_$WarbandContainerToJson`.
  Map<String, dynamic> toJson() => _$WarbandContainerToJson(this);
}
