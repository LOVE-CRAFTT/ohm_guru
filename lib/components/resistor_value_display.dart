import 'package:flutter/material.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';

class ResistorValueDisplay extends StatelessWidget {
  const ResistorValueDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    getResistance();
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
          const SizedBox(
            height: 10.0,
          ),
          if (resistance != null)
            Expanded(
              child: Text(
                "$resistance",
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
        ],
      ),
    );
  }
}
