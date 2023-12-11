import 'package:flutter/material.dart';

class SpecialButton extends StatelessWidget {
  const SpecialButton(this.data, {required this.onPressed, super.key});
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
                  Theme.of(context).colorScheme.primary.alpha,
                  Theme.of(context).colorScheme.primary.red,
                  Theme.of(context).colorScheme.primary.green,
                  Theme.of(context).colorScheme.primary.blue)
              .withOpacity(0.3),
        ),
      ),
      child: Text(
        data,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
