import 'package:flutter/material.dart';

///Resistance text displayed in a concise manner
class ResistorValueDisplay extends StatelessWidget {
  const ResistorValueDisplay({
    super.key,
    required this.displayResistanceString,
  });

  final String? displayResistanceString;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            child: Text(
              "Resistor Value: ",
              style: TextStyle(fontSize: 40.0),
            ),
          ),

          ///The text is only displayed if the resistance is not null, and the resistance can be not null only when all the available bands have been given values
          if (displayResistanceString != null)
            Expanded(
              child: Text(
                "$displayResistanceString",
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
        ],
      ),
    );
  }
}
