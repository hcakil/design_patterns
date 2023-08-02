import 'package:flutter/material.dart';

// lib/models/sandwich.dart

import 'bread.dart';
import 'filling.dart';
import 'sauce.dart';

class Sandwich {
  final Bread bread;
  final Filling filling;
  final Sauce sauce;

  Sandwich({required this.bread, required this.filling, required this.sauce});
}
