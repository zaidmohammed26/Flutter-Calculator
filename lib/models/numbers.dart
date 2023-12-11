import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton(
    this.data, {
    required this.onPressed,
    super.key,
  });
  final String data;
  final void Function(String data) onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed(data);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(
                  Theme.of(context).colorScheme.secondary.alpha,
                  Theme.of(context).colorScheme.secondary.red,
                  Theme.of(context).colorScheme.secondary.green,
                  Theme.of(context).colorScheme.secondary.blue)
              .withOpacity(0.3),
        ),
      ),
      child: Text(
        data.toString(),
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }
}
