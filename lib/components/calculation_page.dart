import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_functions.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({
    super.key,
    required this.bandType,
  });

  final int bandType;

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
                      dropdownMenuEntries: buildBandColors(),
                      label: const Text("First Band"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: const InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.blue,
                      ),
                      onSelected: (band) {
                        debugPrint(band.toString());
                      },
                      enableSearch: false,
                    ),
                    DropdownMenu(
                      dropdownMenuEntries: buildBandColors(),
                      label: const Text("Second Band"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: const InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.blue,
                      ),
                      onSelected: (band) {
                        debugPrint(band.toString());
                      },
                      enableSearch: false,
                    ),
                    if (bandType == 5 || bandType == 6)
                      DropdownMenu(
                        dropdownMenuEntries: buildBandColors(),
                        label: const Text("Third Band"),
                        width: constraints.maxWidth,
                        inputDecorationTheme: const InputDecorationTheme(
                          filled: true,
                          fillColor: Colors.blue,
                        ),
                        onSelected: (band) {
                          debugPrint(band.toString());
                        },
                        enableSearch: false,
                      ),
                    DropdownMenu(
                      dropdownMenuEntries: buildMultiplierBandColors(),
                      label: const Text("Multiplier"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: const InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.blue,
                      ),
                      onSelected: (band) {
                        debugPrint(band.toString());
                      },
                      enableSearch: false,
                    ),
                    DropdownMenu(
                      dropdownMenuEntries: buildToleranceBandColors(),
                      label: const Text("Tolerance"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: const InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.blue,
                      ),
                      onSelected: (band) {
                        debugPrint(band.toString());
                      },
                      enableSearch: false,
                    ),
                    if (bandType == 6)
                      DropdownMenu(
                        dropdownMenuEntries: buildPPMBandColors(),
                        label: const Text("PPM"),
                        width: constraints.maxWidth,
                        inputDecorationTheme: const InputDecorationTheme(
                          filled: true,
                          fillColor: Colors.blue,
                        ),
                        onSelected: (band) {
                          debugPrint(band.toString());
                        },
                        enableSearch: false,
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
