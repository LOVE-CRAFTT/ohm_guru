import 'package:flutter/material.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({
    super.key,
    required this.tempString,
  });

  final String tempString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: Text(tempString),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
