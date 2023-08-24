import 'package:flutter/material.dart';

import 'character.dart';

class Wizard extends Character {
  final int intelligence;

  Wizard({required int x, required int y, required Color color, required this.intelligence})
      : super(x: x, y: y, color: color);

        @override
          Wizard clone() {
    return Wizard(x: x, y: y, color: color, intelligence: intelligence);
  }
}