import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'text')
enum Weapon {
  dagger(text: 'Dagger', attacks: 2, power: 1, pairing: true),
  oneHanded(text: 'One-Handed', pairing: true),
  twoHanded(text: 'Two-Handed', power: 3),
  spear(text: 'Spear', pairing: true, trait: 'If the model is not carrying any other pairing weapon or shield, this weapon has R 2 instead of R 1.'),
  halberd(text: 'Halberd', power: 3, range: 2),
  bow(text: 'Bow', range: 24),
  crossbow(text: 'Crossbow', range: 12, piercing: 1),
  musket(text: 'Musket', range: 12),
  longRifle(text: 'Long Rifle', range: 24),
  pistol(text: 'Pistol', range: 8, pairing: true, piercing: 1),
  spinGun(text: 'Spin Gun', range: 12, attacks: 4, power: 2),
  trollbane(text: 'Trollbane', trait: 'When an attack made by this weapon deals damage to a model, that model can not regain health until the end of its next activation.')
  ;

  const Weapon({required this.text, this.attacks = 1, this.power = 2, this.range = 1, this.pairing = false, this.piercing, this.trait});

  final String text;
  final int attacks;
  final int power;
  final int range;
  final bool pairing;
  final int? piercing;
  final String? trait;

  @override
  String toString() {
    return text;
  }

  static Weapon fromString(String name) {
    return Weapon.values.firstWhere((weapon) => weapon.toString() == name);
  }
}
