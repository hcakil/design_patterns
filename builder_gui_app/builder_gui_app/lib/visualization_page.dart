// lib/visualization_page.dart

import 'package:flutter/material.dart';
import 'models/pizza.dart';

class CustomPizzaVisualizationPage extends StatelessWidget {
  final Pizza pizza;

  const CustomPizzaVisualizationPage({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Pizza Visualization'),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/pizza.png',
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
          ListTile(title: Text('Crust: ${pizza.crust.name}')),
          ListTile(title: Text('Sauce: ${pizza.sauce.name}')),
          ListTile(
            title: const Text('Toppings'),
            subtitle: pizza.toppings.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pizza.toppings.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(pizza.toppings[index].isVegetarian ? Icons.circle : Icons.circle_outlined),
                        title: Text(pizza.toppings[index].name),
                      );
                    },
                  )
                : const Text('None'),
          ),
        ],
      ),
    );
  }
}
