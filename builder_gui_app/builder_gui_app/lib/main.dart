// lib/main.dart

import 'package:flutter/material.dart';
import 'models/pizza.dart';
import 'pizza_builder.dart';
import 'pizza_director.dart';
import 'visualization_page.dart';

void main() {
  runApp(PizzaApp());
}

class PizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Pizza Builder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PizzaOrderPage(),
    );
  }
}

class PizzaOrderPage extends StatefulWidget {
  @override
  _PizzaOrderPageState createState() => _PizzaOrderPageState();
}

class _PizzaOrderPageState extends State<PizzaOrderPage> {
  PizzaBuilder _builder = PizzaBuilder();
  PizzaDirector _director = PizzaDirector();
  Pizza? _customPizza;

  void _buildCustomPizza() {
    _customPizza = _director.buildCustomPizza(_builder);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Custom Pizza'),
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
              child: Text('Close'),
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
          title: Text('Pizza Not Built'),
          content: Text('Please build your custom pizza first.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
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
        title: Text('Custom Pizza Builder'),
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
        child: Icon(Icons.visibility_outlined),
      ),
    );
  }
}