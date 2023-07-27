// lib/pizza_builder.dart

import 'models/crust.dart';
import 'models/sauce.dart';
import 'models/topping.dart';
import 'models/pizza.dart';

abstract class AbstractBuilder {
  void addCrust(Crust crust);
  void addSauce(Sauce sauce);
  void addTopping(Topping topping);
  Pizza build();
}
