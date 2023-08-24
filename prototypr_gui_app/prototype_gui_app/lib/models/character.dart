


import 'package:flutter/material.dart';

abstract class Character {
  final int x;
  final int y;
  final Color color;

  Character({required this.x, required this.y, required this.color});

  Character clone();
}