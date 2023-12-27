// ignore_for_file: avoid_print

import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;

  // height is given in cm so we div by 100 to get meters.
  // weight is given in kg.
  // formula bmi = kg/sqr(meters)
  // https://www.cdc.gov/healthyweight/assessing/bmi/childrens_BMI/childrens_BMI_formula.html
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }
}
