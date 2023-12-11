import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  DisplayScreen(
      {required this.operand1,
      required this.operand2,
      required this.answer,
      required this.operator,
      super.key});
  String? operand1;
  String? operand2;
  String? operator;
  String? answer;
  @override
  State<DisplayScreen> createState() {
    return _DisplayScreen();
  }
}

class _DisplayScreen extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.secondaryContainer,
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.operand1!,
                  style: TextStyle(
                      // overflow: TextOverflow.fade,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.operator!,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.operand2!,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.answer!,
            style: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer
                  .withOpacity(0.8),
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
