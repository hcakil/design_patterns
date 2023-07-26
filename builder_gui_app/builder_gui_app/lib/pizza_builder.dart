// lib/pizza_builder.dart

import 'models/crust.dart';
import 'models/sauce.dart';
import 'models/topping.dart';
import 'models/pizza.dart';

class PizzaBuilder {
  Crust? _crust;
  Sauce? _sauce;
  List<Topping> _toppings = [];

  void addCrust(Crust crust) {
    _crust = crust;
  }

  void addSauce(Sauce sauce) {
    _sauce = sauce;
  }

  void addTopping(Topping topping) {
    _toppings.add(topping);
  }

  Pizza build() {
    return Pizza(
      crust: _crust ?? Crust(id: 0, name: 'Default Crust', diameter: 12.0, isThick: false),
      sauce: _sauce ?? Sauce(id: 0, name: 'Default Sauce', type: 'Tomato'),
      toppings: _toppings,
    );
  }
}
