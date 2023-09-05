import 'package:flutter/material.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({
    super.key,
    required this.tempString,
  });

  final String tempString;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Resistor Parameters"),
                DropdownMenu(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: Text("Blue"), label: "Blue"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
