import 'dart:io';

import 'package:adapter_console_app/adapter_console_app.dart' as adapter_console_app;

import 'adapter/thermometer_adapter.dart';
import 'models/celcius_thermometer.dart';
import 'models/fahreneit_thermometer.dart';

void main() {
   print("Select the temperature type to convert from:");
  print("1. Celsius");
  print("2. Fahrenheit");
  int choice = int.parse(stdin.readLineSync()!); // Add the "!" to assert that the result is non-null.

  double inputValue;
  String inputType;

  if (choice == 1) {
    print("Enter the temperature in Celsius:");
    String? input = stdin.readLineSync(); // Read the input as a nullable string.
    if (input != null) {
      inputValue = double.parse(input);
    } else {
      print("Invalid input.");
      return;
    }
    inputType = "Celsius";
  } else if (choice == 2) {
    print("Enter the temperature in Fahrenheit:");
    String? input = stdin.readLineSync(); // Read the input as a nullable string.
    if (input != null) {
      inputValue = double.parse(input);
    } else {
      print("Invalid input.");
      return;
    }
    inputType = "Fahrenheit";
  } else {
    print("Invalid choice. Please select 1 or 2.");
    return;
  }

  // Create instances of CelsiusThermometer and FahrenheitThermometer.
  final celsiusThermometer = CelsiusThermometer(inputType == "Celsius" ? inputValue : (inputValue - 32) * 5 / 9);
  final fahrenheitThermometer = FahrenheitThermometer(inputType == "Fahrenheit" ? inputValue : (inputValue * 9 / 5) + 32);

  // Use the adapters to make them compatible with the Thermometer interface.
  final celsiusAdapter = ThermometerAdapter(celsiusThermometer);
  final fahrenheitAdapter = ThermometerAdapter(fahrenheitThermometer);

  // Show the converted temperatures.
  if (inputType == "Celsius") {
    print(fahrenheitAdapter.show()); // Output: Temperature in Fahrenheit: [converted value]°F
  } else {
    print(celsiusAdapter.show()); // Output: Temperature in Celsius: [converted value]°C
  }
}
