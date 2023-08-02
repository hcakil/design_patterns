import 'package:factory_method_gui_app/factory/sandwich_fartory.dart';
import 'package:factory_method_gui_app/model/sandwich.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const SandwichApp());
}

class SandwichApp extends StatelessWidget {
  const SandwichApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Sandwich Factory',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SandwichFactoryPage(),
    );
  }
}

class SandwichFactoryPage extends StatelessWidget {
  const SandwichFactoryPage({super.key});

  void _navigateToVisualizationPage(BuildContext context, SandwichFactory factory) {
    Sandwich sandwich = Sandwich(
      bread: factory.createBread(),
      filling: factory.createFilling(),
      sauce: factory.createSauce(),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SandwichVisualizationPage(sandwich: sandwich)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Sandwich Factory'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ElevatedButton(
              onPressed: () => _navigateToVisualizationPage(context, ItalianSandwichFactory()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Change the color for Italian Sandwich button
              ),
              child: const Text('Build Italian Sandwich'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToVisualizationPage(context, VeggieSandwichFactory()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Change the color for Veggie Sandwich button
              ),
              child: const Text('Build Veggie Sandwich'),
            ),
          ],
        ),
      ),
    );
  }
}

class SandwichVisualizationPage extends StatefulWidget {
  final Sandwich sandwich;

  const SandwichVisualizationPage({super.key, required this.sandwich});

  @override
  // ignore: library_private_types_in_public_api
  _SandwichVisualizationPageState createState() => _SandwichVisualizationPageState();
}

class _SandwichVisualizationPageState extends State<SandwichVisualizationPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.sandwich.bread.type.contains("Italian") ?'Italian Sandwich ' : 'Veggie Sandwich'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                  widget.sandwich.bread.type.contains("Italian") ? 'assets/sandwich1.png' : 'assets/sandwich2.jpeg' ,
                    height: 400,
                    width: 400,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text('Bread: ${widget.sandwich.bread.type}'),
                  Text('Filling: ${widget.sandwich.filling.name}'),
                  Text('Sauce: ${widget.sandwich.sauce.type}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
