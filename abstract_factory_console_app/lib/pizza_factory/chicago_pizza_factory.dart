import 'abstract_factory.dart';

class ChicagoPizzaFactory implements PizzaFactory {
  @override
  String createDough() {
    return 'Thick Crust Dough';
  }

  @override
  String createSauce() {
    return 'Plum Tomato Sauce';
  }

  @override
  List<String> createToppings() {
    return ['Shredded Mozzarella Cheese', 'Black Olives', 'Spinach', 'Eggplant', 'Sliced Pepperoni'];
  }
}