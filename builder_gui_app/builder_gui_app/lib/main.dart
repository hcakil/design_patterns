// lib/main.dart

import 'package:flutter/material.dart';

import 'models/pizza.dart';
import 'pizza_builder.dart';
import 'pizza_director.dart';
import 'visualization_page.dart';

void main() {
  runApp(const PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Pizza Builder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PizzaOrderPage(),
    );
  }
}

class PizzaOrderPage extends StatefulWidget {
  const PizzaOrderPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PizzaOrderPageState createState() => _PizzaOrderPageState();
}

class _PizzaOrderPageState extends State<PizzaOrderPage> {
  final PizzaBuilder _builder = PizzaBuilder();
  final PizzaDirector _director = PizzaDirector();
  Pizza? _customPizza;

  void _buildCustomPizza() {
    _customPizza = _director.buildCustomPizza(_builder);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Custom Pizza'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Crust: ${_customPizza!.crust.name}'),
              Text('Sauce: ${_customPizza!.sauce.name}'),
              Text('Toppings: ${_customPizza!.toppings.map((topping) => topping.name).join(", ")}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pizza Not Built'),
          content: const Text('Please build your custom pizza first.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Pizza Builder'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _customPizza != null ? _showAlert : _buildCustomPizza,
          child: Text(_customPizza != null ? 'Pizza Built' : 'Build Custom Pizza'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_customPizza != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomPizzaVisualizationPage(pizza: _customPizza!)),
            );
          } else {
            _showAlert();
          }
        },
        child: const Icon(Icons.visibility_outlined),
      ),
    );
  }
}
