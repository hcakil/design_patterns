// FahrenheitThermometer is a concrete class that calculates temperature in Fahrenheit.
import 'thermometer.dart';

class FahrenheitThermometer implements Thermometer {
  double temperatureInFahrenheit;

  FahrenheitThermometer(this.temperatureInFahrenheit);

  @override
  String show() {
    var value =(temperatureInFahrenheit *9/5)+32; 
    return "Temperature in Fahrenheit: $value°F";
  }
}