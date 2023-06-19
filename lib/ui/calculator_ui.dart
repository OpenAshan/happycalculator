import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:name/controllers/calculator_controller.dart';
import 'package:name/controllers/button_controller.dart';

class CalculatorUI extends StatelessWidget {
  Widget buildButton(String buttonText, Color textColor) {
    return Consumer<CalculatorController>(
      builder: (context, calculator, _) {
        return ButtonController(buttonText, textColor).buildButton(
          () => calculator.buttonPressed(buttonText),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorController>(
      create: (context) => CalculatorController(),
      child: Consumer<CalculatorController>(
        builder: (context, calculator, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Happy Calculator',
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                ),
              ),
              backgroundColor: Color(0xFF0B2639),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Container(
                  color: Color(0xFF0B2639),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  alignment: Alignment.bottomRight,
                  child: ValueListenableBuilder<String>(
                    valueListenable: calculator.outputNotifier,
                    builder: (context, value, _) {
                      return Text(
                        value,
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFBFCFD),
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: Color(0xFF207DB8),
                  height: 1.0,
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFF0C2742),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              buildButton('C', Color(0xFFCC7549)),
                              buildButton('()', Color(0xFF1AA9FE)),
                              buildButton('%', Color(0xFF1AA9FE)),
                              buildButton('÷', Color(0xFF1AA9FE)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              buildButton('7', Color(0xFFE4F0F4)),
                              buildButton('8', Color(0xFFE4F0F4)),
                              buildButton('9', Color(0xFFE4F0F4)),
                              buildButton('×', Color(0xFF1AA9FE)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              buildButton('4', Color(0xFFE4F0F4)),
                              buildButton('5', Color(0xFFE4F0F4)),
                              buildButton('6', Color(0xFFE4F0F4)),
                              buildButton('-', Color(0xFF1AA9FE)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              buildButton('1', Color(0xFFE4F0F4)),
                              buildButton('2', Color(0xFFE4F0F4)),
                              buildButton('3', Color(0xFFE4F0F4)),
                              buildButton('+', Color(0xFF1AA9FE)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              buildButton('0', Color(0xFFE4F0F4)),
                              buildButton('.', Color(0xFFE4F0F4)),
                              buildButton('000', Color(0xFFE4F0F4)),
                              buildButton('=', Color(0xFF1AA9FE)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              buildButton('sin', Color(0xFFE4F0F4)),
                              buildButton('cos', Color(0xFFE4F0F4)),
                              buildButton('tan', Color(0xFFE4F0F4)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
