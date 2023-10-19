import 'package:adapter_design_pattern/adapters/temperature_adapter.dart';
import 'package:adapter_design_pattern/models/temprature.dart';
import 'package:flutter/material.dart';

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  final TextEditingController _celsiusController = TextEditingController();
  final TextEditingController _fahrenheitController = TextEditingController();

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Temperature Converter', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.green.shade100,
    ),
    body: Center(
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16),

        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2, color: Colors.blue),
              ),
              child: TextField(
                controller: _celsiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Celsius', border: InputBorder.none),
                onChanged: _convertCelsiusToFahrenheit,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2, color: Colors.blue),
              ),
              child: TextField(
                controller: _fahrenheitController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Fahrenheit', border: InputBorder.none),
                onChanged: _convertFahrenheitToCelsius,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  

  void _convertCelsiusToFahrenheit(String value) {
    try {
      final double celsius = double.parse(value);
      final Temperature celsiusTemperature = Temperature(celsius, 'Celsius');
      final Temperature fahrenheitTemperature = TemperatureAdapter.celsiusToFahrenheit(celsiusTemperature);
      _fahrenheitController.text = fahrenheitTemperature.value.toStringAsFixed(2);
    } catch (e) {
      _fahrenheitController.text = '';
    }
  }

  void _convertFahrenheitToCelsius(String value) {
    try {
      final double fahrenheit = double.parse(value);
      final Temperature fahrenheitTemperature = Temperature(fahrenheit, 'Fahrenheit');
      final Temperature celsiusTemperature = TemperatureAdapter.fahrenheitToCelsius(fahrenheitTemperature);
      _celsiusController.text = celsiusTemperature.value.toStringAsFixed(2);
    } catch (e) {
      _celsiusController.text = '';
    }
  }
}
