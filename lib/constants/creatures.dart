import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'text')
enum Creature {
  human(text: 'Human', health: 5, move: 5, gold: 50),
  dwarf(text: 'Dwarf', health: 6, move: 4, gold: 55),
  spectre(text: 'Spectre', health: 3, move: 5, gold: 50),
  zombie(text: 'Zombie', health: 4, move: 4, gold: 50),
  skeleton(text: 'Skeleton', health: 5, move: 4, gold: 55),
  ratman(text: 'Ratman', health: 4, move: 6, gold: 40),
  orc(text: 'Orc', health: 8, move: 5, gold: 100),
  gallimimus(text: 'Gallimimus', health: 4, move: 6, gold: 45),
  saurusSapiens(text: 'Saurus Sapiens', health: 5, move: 5, defence: 1, gold: 100),
  stormWarrior(text: 'Storm Warrior', health: 7, move: 5, gold: 75),
  mountainTroll(text: 'Mountain Troll', health: 9, move: 5, defence: 1, gold: 115),
  woodlandTroll(text: 'Woodland Troll', health: 9, move: 5, gold: 100),
  ;

  const Creature(
      {required this.text, required this.health, required this.move, required this.gold, this.defence = 0});

  final String text;
  final int health;
  final int move;
  final int defence;
  final int gold;

  @override
  String toString() {
    return text;
  }

  static Creature fromString(String name) {
    return Creature.values.firstWhere((creature) => creature.toString() == name);
  }
}
