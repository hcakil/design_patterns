

import 'package:adapter_design_pattern/models/temprature.dart';

class TemperatureAdapter {
  static Temperature celsiusToFahrenheit(Temperature celsius) {
    final double fahrenheitValue = (celsius.value * 9 / 5) + 32;
    return Temperature(fahrenheitValue, 'Fahrenheit');
  }

  static Temperature fahrenheitToCelsius(Temperature fahrenheit) {
    final double celsiusValue = (fahrenheit.value - 32) * 5 / 9;
    return Temperature(celsiusValue, 'Celsius');
  }
}
