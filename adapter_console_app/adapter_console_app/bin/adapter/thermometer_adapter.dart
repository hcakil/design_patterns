// ThermometerAdapter adapts the different thermometers to the Thermometer interface.
import '../models/thermometer.dart';

class ThermometerAdapter implements Thermometer {
  final Thermometer thermometer;

  ThermometerAdapter(this.thermometer);

  @override
  String show() {
    return thermometer.show();
  }
}