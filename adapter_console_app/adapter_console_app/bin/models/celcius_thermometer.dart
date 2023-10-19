
// CelsiusThermometer is a concrete class that calculates temperature in Celsius.
import 'thermometer.dart';

class CelsiusThermometer implements Thermometer {
  double temperatureInCelsius;

  CelsiusThermometer(this.temperatureInCelsius);

  @override
  String show() {
        var value =(temperatureInCelsius-32 )*5/9; 
    return "Temperature in Celsius: $value°C";
  }
}