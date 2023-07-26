
import 'dart:io';

import 'package:abstract_factory_console_app/pizza_factory/abstract_factory.dart';
import 'package:abstract_factory_console_app/pizza_factory/ny_pizza_factory.dart';
import 'package:abstract_factory_console_app/pizza_factory/chicago_pizza_factory.dart';


void main() {
  // Prompt the user for pizza style choice
  print('Choose a pizza style:');
  print('1. New York Style');
  print('2. Chicago Style');
  stdout.write('Enter your choice (1 or 2): ');
  String? input = stdin.readLineSync()?.trim();

  // Validate and process user choice
  bool isNYStyle = input == '1';

  // Create the pizza factory based on the selected style
  PizzaFactory pizzaFactory = isNYStyle ? NYPizzaFactory() : ChicagoPizzaFactory();

  // Create a pizza using the factory
  String dough = pizzaFactory.createDough();
  String sauce = pizzaFactory.createSauce();
  List<String> toppings = pizzaFactory.createToppings();

  // Display the pizza details
  print('Pizza Details:');
  print('Dough: $dough');
  print('Sauce: $sauce');
  print('Toppings: ${toppings.join(', ')}');
}





