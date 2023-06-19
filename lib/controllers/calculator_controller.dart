import 'dart:math' as math;
import 'package:flutter/foundation.dart';

class CalculatorController extends ChangeNotifier {
  ValueNotifier<String> _output = ValueNotifier<String>('0');
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  String _finalResult = '';

  ValueNotifier<String> get outputNotifier => _output;

  String get output => _output.value;

  set output(String value) {
    _output.value = value;
  }

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      output = '0';
      _num1 = 0;
      _num2 = 0;
      _operand = '';
      _finalResult = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      _num1 = double.parse(output);
      _operand = buttonText;
      output = '0';
    } else if (buttonText == '=') {
      _num2 = double.parse(output);
      if (_operand == '+') {
        _finalResult = (_num1 + _num2).toString();
      } else if (_operand == '-') {
        _finalResult = (_num1 - _num2).toString();
      } else if (_operand == '×') {
        _finalResult = (_num1 * _num2).toString();
      } else if (_operand == '÷') {
        _finalResult = (_num1 / _num2).toString();
      }
      output = _finalResult;
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else if (buttonText == 'sin') {
      final value = double.parse(output);
      final result = math.sin(value);
      output = result.toStringAsFixed(2);
    } else if (buttonText == 'cos') {
      final value = double.parse(output);
      final result = math.cos(value);
      output = result.toStringAsFixed(2);
    } else if (buttonText == 'tan') {
      final value = double.parse(output);
      final result = math.tan(value);
      output = result.toStringAsFixed(2);
    } else {
      if (output == '0') {
        output = buttonText;
      } else {
        output += buttonText;
      }
    }

    notifyListeners();
  }
}
