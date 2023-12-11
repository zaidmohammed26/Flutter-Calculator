import 'package:calculator/models/numbers.dart';
import 'package:calculator/models/special_buttons.dart';
import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  const NumberPad(
      {required this.numberPressed,
      required this.operatorPressed,
      required this.result,
      required this.delete,
      required this.setAnswer,
      super.key});
  final void Function(String data) numberPressed;
  final void Function(String data) operatorPressed;
  final void Function(String data) delete;
  final void Function(String data) result;
  final void Function() setAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
        ),
        children: [
          SpecialButton(
            "AC",
            onPressed: delete,
          ),
          SpecialButton(
            "%",
            onPressed: operatorPressed,
          ),
          SpecialButton(
            "/",
            onPressed: operatorPressed,
          ),
          SpecialButton(
            "X",
            onPressed: operatorPressed,
          ),
          NumberButton(
            '1',
            onPressed: numberPressed,
          ),
          NumberButton(
            '2',
            onPressed: numberPressed,
          ),
          NumberButton(
            '3',
            onPressed: numberPressed,
          ),
          SpecialButton(
            "-",
            onPressed: operatorPressed,
          ),
          NumberButton(
            '4',
            onPressed: numberPressed,
          ),
          NumberButton(
            '5',
            onPressed: numberPressed,
          ),
          NumberButton(
            '6',
            onPressed: numberPressed,
          ),
          SpecialButton(
            "+",
            onPressed: operatorPressed,
          ),
          NumberButton(
            '7',
            onPressed: numberPressed,
          ),
          NumberButton(
            '8',
            onPressed: numberPressed,
          ),
          NumberButton(
            '9',
            onPressed: numberPressed,
          ),
          SpecialButton(
            "C",
            onPressed: delete,
          ),
          NumberButton(
            '0',
            onPressed: numberPressed,
          ),
          NumberButton(
            ".",
            onPressed: numberPressed,
          ),
          SpecialButton(
            "=",
            onPressed: result,
          ),
        ],
      ),
    );
  }
}
