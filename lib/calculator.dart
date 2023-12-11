// ISSUES:

import 'package:calculator/display_screen.dart';
import 'package:calculator/number_pad.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String? operand1;
  String? operand2;
  String? operator;
  String? answer;

  void delete(data) {
    if (data == 'AC') {
      setState(() {
        operand1 = '';
        operand2 = '';
        operator = '';
        answer = '';
      });
      return;
    }
    if (operator == '') {
      if (operand1 == '') {
        setState(() {
          operand1 = '';
        });
        return;
      }
      setState(() {
        // operand1 = (int.parse(operand1!) ~/ 10).toString();
        operand1 = operand1!.replaceRange(operand1!.length - 1, null, "");
      });
      return;
    } else {
      if (operand2 == '') {
        setState(() {
          operator = '';
          operand2 = '';
        });
        return;
      }
      setState(() {
        // operand2 = (int.parse(operand2!) ~/ 10).toString();
        operand2 = operand2!.replaceRange(operand2!.length - 1, null, "");
      });
      setAnswer();
      return;
    }
  }

  void result(data) {
    if (operand1 == '' || operand2 == "") {
      return;
    }
    if (double.parse(answer!) % 1 == 0) {
      answer = answer!.replaceRange(answer!.length - 2, null, "");
    }

    setState(() {
      operand1 = answer;
      operator = '';
      operand2 = '';
      answer = '';
    });
  }

  void operatorPressed(data) {
    if (operand2 == '') {
      setState(() {
        operator = data;
      });
    } else {
      setState(() {
        operand1 = answer;
        operator = data;
        operand2 = '';
        answer = '';
      });
    }
  }

  void setAnswer() {
    if (operand2 == '') {
      setState(() {
        answer = '';
      });
      return;
    }
    switch (operator) {
      case '+':
        setState(() {
          answer =
              (double.parse(operand1!) + double.parse(operand2!)).toString();
        });
        break;
      case '-':
        setState(() {
          answer =
              (double.parse(operand1!) - double.parse(operand2!)).toString();
        });
        break;
      case 'X':
        setState(() {
          answer =
              (double.parse(operand1!) * double.parse(operand2!)).toString();
        });
        break;
      case '/':
        setState(() {
          answer =
              (double.parse(operand1!) / double.parse(operand2!)).toString();
        });
        break;
      case '%':
        setState(() {
          answer =
              (double.parse(operand1!) % double.parse(operand2!)).toString();
        });
        break;
    }
  }

  void numberPressed(data) {
    if (operator == '') {
      if (data == '.' && operand1!.contains('.')) {
        return;
      }
      setState(() {
        operand1 = operand1! + data;
      });
    } else {
      if (data == '.' && operand2!.contains('.')) {
        return;
      }
      setState(() {
        operand2 = operand2! + data;
      });
      setAnswer();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (operand1 == null) {
      setState(() {
        operand1 = '';
      });
    }
    if (operand2 == null) {
      setState(() {
        operand2 = '';
      });
    }
    if (operator == null) {
      setState(() {
        operator = '';
      });
    }
    if (answer == null) {
      setState(() {
        answer = '';
      });
    }
    return Scaffold(
      body: Column(
        children: [
          DisplayScreen(
            operand1: operand1,
            operand2: operand2,
            operator: operator,
            answer: answer,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: NumberPad(
                delete: delete,
                numberPressed: numberPressed,
                operatorPressed: operatorPressed,
                result: result,
                setAnswer: setAnswer),
          ),
        ],
      ),
    );
  }
}
