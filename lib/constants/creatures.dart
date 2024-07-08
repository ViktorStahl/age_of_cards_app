import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'text')
enum Creature {
  human(text: 'Human', health: 5, move: 5),
  spectre(text: 'Spectre', health: 3, move: 5),
  orc(text: 'Orc', health: 8, move: 4);

  const Creature(
      {required this.text, required this.health, required this.move});

  final String text;
  final int health;
  final int move;
  final int defence = 0;

  @override
  String toString() {
    return text;
  }

  static Creature fromString(String name) {
    return Creature.values.firstWhere((creature) => creature.toString() == name);
  }
}
