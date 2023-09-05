import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/band_functions.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({
    super.key,
    required this.tempString,
  });

  final String tempString;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Resistor Parameters"),
                    DropdownMenu(
                      dropdownMenuEntries: buildBandColors(bandDetails),
                      label: const Text("First Band"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: const InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.blue,
                      ),

                      //TODO refactor trailing icon so it's its own component and is responsive to change
                      trailingIcon: const Row(
                        children: [
                          Expanded(
                            child: Text("1"),
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Placeholder(),
          ),
        ),
      ],
    );
  }
}
