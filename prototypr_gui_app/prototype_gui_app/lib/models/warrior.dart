import 'package:flutter/material.dart';

import 'character.dart';

class Warrior extends Character {
  final int strength;

  Warrior({required int x, required int y, required Color color, required this.strength})
      : super(x: x, y: y, color: color);

        @override
          Warrior clone() {
    return Warrior(x: x, y: y, color: color, strength: strength);
  }
}