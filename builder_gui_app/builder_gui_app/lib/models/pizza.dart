// lib/pizza.dart

import 'crust.dart';
import 'sauce.dart';
import 'topping.dart';

class Pizza {
  Crust crust;
  Sauce sauce;
  List<Topping> toppings;

  Pizza({required this.crust, required this.sauce, required this.toppings});
}
