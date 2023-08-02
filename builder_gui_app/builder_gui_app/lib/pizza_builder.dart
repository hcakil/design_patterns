// lib/pizza_builder.dart

import 'package:builder_gui_app/abstract_builder.dart';

import 'models/crust.dart';
import 'models/sauce.dart';
import 'models/topping.dart';
import 'models/pizza.dart';

class PizzaBuilder implements AbstractBuilder {
  Crust? _crust;
  Sauce? _sauce;
  final List<Topping> _toppings = [];

  @override
  void addCrust(Crust crust) {
    _crust = crust;
  }

  @override
  void addSauce(Sauce sauce) {
    _sauce = sauce;
  }

  @override
  void addTopping(Topping topping) {
    _toppings.add(topping);
  }

  @override
  Pizza build() {
    return Pizza(
      crust: _crust ?? Crust(id: 0, name: 'Default Crust', diameter: 12.0, isThick: false),
      sauce: _sauce ?? Sauce(id: 0, name: 'Default Sauce', type: 'Tomato'),
      toppings: _toppings,
    );
  }
}
