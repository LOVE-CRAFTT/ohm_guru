import 'package:flutter/material.dart';

class ResistorValueDisplay extends StatelessWidget {
  const ResistorValueDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              "Resistor Value: ",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Text(
              "22.9G Ohms .25% 25ppm",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }
}
