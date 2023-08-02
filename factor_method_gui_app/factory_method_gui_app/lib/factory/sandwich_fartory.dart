// lib/models/sandwich_factory.dart

import 'package:factory_method_gui_app/model/bread.dart';
import 'package:factory_method_gui_app/model/filling.dart';
import 'package:factory_method_gui_app/model/sauce.dart';



abstract class SandwichFactory {
  Bread createBread();
  Filling createFilling();
  Sauce createSauce();
}

class ItalianSandwichFactory extends SandwichFactory {
  @override
  Bread createBread() {
    return Bread('Italian Bread');
  }

  @override
  Filling createFilling() {
    return Filling('Salami');
  }

  @override
  Sauce createSauce() {
    return Sauce('Pesto Sauce');
  }
}

class VeggieSandwichFactory extends SandwichFactory {
  @override
  Bread createBread() {
    return Bread('Whole Wheat Bread');
  }

  @override
  Filling createFilling() {
    return Filling('Veggies');
  }

  @override
  Sauce createSauce() {
    return Sauce('Hummus');
  }
}
