import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'text')
enum Creature {
  human(text: 'Human', health: 5, move: 5),
  spectre(text: 'Spectre', health: 3, move: 5),
  orc(text: 'Orc', health: 8, move: 4),
  ratman(text: 'Ratman', health: 4, move: 6),
  gallimimus(text: 'Gallimimus', health: 4, move: 6),
  saurusSapiens(text: 'Saurus Sapiens', health: 4, move: 6, defence: 1),
  dwarf(text: 'Dwarf', health: 6, move: 4),
  mountainTroll(text: 'Mountain Troll', health: 9, move: 5, defence: 1),
  woodlandTroll(text: 'Woodland Troll', health: 9, move: 5),
  skeleton(text: 'Skeleton', health: 5, move: 4),
  zombie(text: 'Zombie', health: 4, move: 4),
  ;

  const Creature(
      {required this.text, required this.health, required this.move, this.defence = 0});

  final String text;
  final int health;
  final int move;
  final int defence;

  @override
  String toString() {
    return text;
  }

  static Creature fromString(String name) {
    return Creature.values.firstWhere((creature) => creature.toString() == name);
  }
}
