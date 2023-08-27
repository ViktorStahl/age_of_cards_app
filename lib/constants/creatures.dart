enum Creature {
  human(text: "Human", health: 5, move: 5),
  spectre(text: "Spectre", health: 3, move: 5),
  orc(text: "Orc", health: 5, move: 4);

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
}
