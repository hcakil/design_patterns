// lib/pizza_director.dart

import 'models/crust.dart';
import 'models/sauce.dart';
import 'models/topping.dart';
import 'pizza_builder.dart';
import 'models/pizza.dart';

class PizzaDirector {
  Pizza buildCustomPizza(PizzaBuilder builder) {
    // You can customize this method to guide the pizza building process.
    // For this example, we'll build a default pizza with specific crust, sauce, and toppings.

    // Default Crust
    builder.addCrust(Crust(id: 1, name: 'Thin Crust', diameter: 12.0, isThick: false));

    // Default Sauce
    builder.addSauce(Sauce(id: 1, name: 'Tomato Sauce', type: 'Tomato'));

    // Default Toppings
    builder.addTopping(Topping(id: 1, name: 'Cheese', isVegetarian: true));
    builder.addTopping(Topping(id: 2, name: 'Pepperoni', isVegetarian: false));

    return builder.build();
  }
}
