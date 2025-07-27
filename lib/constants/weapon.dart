import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'text')
enum Weapon {
  dagger(text: 'Dagger', attacks: 2, power: 1, pairing: true, gold: 0),
  oneHanded(text: 'One-Handed', pairing: true, gold: 25),
  twoHanded(text: 'Two-Handed', power: 3, gold: 40),
  spear(text: 'Spear', pairing: true, trait: 'If the model is not carrying any other pairing weapon or shield, this weapon has R 2 instead of R 1.', gold: 25),
  halberd(text: 'Halberd', power: 3, range: 2, gold: 45),
  bow(text: 'Bow', range: 24, gold: 35),
  crossbow(text: 'Crossbow', range: 12, piercing: 1, gold: 40),
  musket(text: 'Musket', range: 12, gold: 40),
  longRifle(text: 'Long Rifle', range: 24, gold: 60),
  pistol(text: 'Pistol', range: 8, pairing: true, piercing: 1, gold: 35),
  spinGun(text: 'Spin Gun', range: 12, attacks: 4, power: 2, gold: 80),
  trollbane(text: 'Trollbane', trait: 'When an attack made by this weapon deals damage to a model, that model can not regain health until the end of its next activation.', gold: 30)
  ;

  const Weapon({required this.text, required this.gold, this.attacks = 1, this.power = 2, this.range = 1, this.pairing = false, this.piercing, this.trait});

  final String text;
  final int attacks;
  final int power;
  final int range;
  final bool pairing;
  final int? piercing;
  final String? trait;
  final int gold;

  @override
  String toString() {
    return text;
  }

  static Weapon fromString(String name) {
    return Weapon.values.firstWhere((weapon) => weapon.toString() == name);
  }
}
