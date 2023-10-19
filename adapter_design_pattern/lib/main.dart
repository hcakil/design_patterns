import 'package:adapter_design_pattern/screens/temprature_converter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverterScreen(),
    );
  }
}
