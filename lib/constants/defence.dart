import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'text')
enum Defence {
  light(text: 'Light Armour', defence: 1),
  heavy(text: 'Heavy Armour', defence: 2),
  shield(
      text: 'Shield',
      health: 1,
      trait:
          '''If the model is wielding a shield it gains the following ability:
  Raise Shield
  Action
  Until this model's next activation, gain +1 Defence. This ability can only be performed once each activation.
'''),
  towerShield(
      text: 'Tower Shield',
      health: 2,
      trait:
          '''If the model is wielding a shield it gains the following ability:
  Raise Shield
  Action
  Until this model's next activation, gain +1 Defence. This ability can only be performed once each activation.
''');

  const Defence({required this.text, this.defence = 0, this.health = 0, this.trait});

  final String text;
  final int defence;
  final int health;
  final String? trait;

  @override
  String toString() {
    return text;
  }

  static Defence fromString(String name) {
    return Defence.values.firstWhere((defence) => defence.toString() == name);
  }
}
