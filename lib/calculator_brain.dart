import 'dart:math';

class CalculatorBrain {
  int weight;
  int height;

  double _bmi;

  CalculatorBrain(this.weight, this.height) {
    _bmi = weight / pow(height / 100, 2);
  }
  String calcBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5)
      return 'UNDERWEIGHT';
    else if (_bmi > 25)
      return 'OVERWEIGHT';
    else
      return 'NORMAL';
  }

  String getExpl1() {
    if (_bmi < 18.5)
      return 'You are lighter than needed!';
    else if (_bmi > 25)
      return 'You have excess body weight';
    else
      return 'You have normal body weight.';
  }

  String getExpl2() {
    if (_bmi < 18.5)
      return 'Eat well!!';
    else if (_bmi > 25)
      return 'Exercise and Diet!!';
    else
      return 'Good job!!';
  }
}
