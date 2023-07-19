import 'abstract_factory.dart';

class NYPizzaFactory implements PizzaFactory {
  @override
  String createDough() {
    return 'Thin Crust Dough';
  }

  @override
  String createSauce() {
    return 'Marinara Sauce';
  }

  @override
  List<String> createToppings() {
    return ['Grated Reggiano Cheese', 'Garlic', 'Onion', 'Mushrooms', 'Red Pepper'];
  }
}