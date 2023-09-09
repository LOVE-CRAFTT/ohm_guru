import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_functions.dart';
import 'package:ohm_guru/utilities/style_constants.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({
    super.key,
    required this.bandType,
  });

  final int bandType;

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
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
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: selectedBand1?.color,
                      ),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedBand1 = band;
                          },
                        );
                      },
                      enableSearch: false,
                      textStyle: dropDownMenuTextStyle(
                        selectedColor: selectedBand1?.color,
                      ),
                      initialSelection: selectedBand1,
                    ),
                    DropdownMenu(
                      dropdownMenuEntries: buildBandColors(),
                      label: const Text("Second Band"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: selectedBand2?.color,
                      ),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedBand2 = band;
                          },
                        );
                      },
                      enableSearch: false,
                      textStyle: dropDownMenuTextStyle(
                        selectedColor: selectedBand2?.color,
                      ),
                      initialSelection: selectedBand2,
                    ),
                    if (widget.bandType == 5 || widget.bandType == 6)
                      DropdownMenu(
                        dropdownMenuEntries: buildBandColors(),
                        label: const Text("Third Band"),
                        width: constraints.maxWidth,
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: selectedBand3?.color,
                        ),
                        onSelected: (band) {
                          setState(
                            () {
                              selectedBand3 = band;
                            },
                          );
                        },
                        enableSearch: false,
                        textStyle: dropDownMenuTextStyle(
                          selectedColor: selectedBand3?.color,
                        ),
                        initialSelection: selectedBand3,
                      ),
                    DropdownMenu(
                      dropdownMenuEntries: buildMultiplierBandColors(),
                      label: const Text("Multiplier"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: selectedMultiplierBand?.color,
                      ),
                      onSelected: (multiplier) {
                        setState(
                          () {
                            selectedMultiplierBand = multiplier;
                          },
                        );
                      },
                      enableSearch: false,
                      textStyle: dropDownMenuTextStyle(
                        selectedColor: selectedMultiplierBand?.color,
                      ),
                      initialSelection: selectedMultiplierBand,
                    ),
                    DropdownMenu(
                      dropdownMenuEntries: buildToleranceBandColors(),
                      label: const Text("Tolerance"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: selectedToleranceBand?.color,
                      ),
                      onSelected: (tolerance) {
                        setState(
                          () {
                            selectedToleranceBand = tolerance;
                          },
                        );
                      },
                      enableSearch: false,
                      textStyle: dropDownMenuTextStyle(
                        selectedColor: selectedToleranceBand?.color,
                      ),
                      initialSelection: selectedToleranceBand,
                    ),
                    if (widget.bandType == 6)
                      DropdownMenu(
                        dropdownMenuEntries: buildPPMBandColors(),
                        label: const Text("PPM"),
                        width: constraints.maxWidth,
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: selectedPPMBand?.color,
                        ),
                        onSelected: (ppm) {
                          setState(
                            () {
                              selectedPPMBand = ppm;
                            },
                          );
                        },
                        enableSearch: false,
                        textStyle: dropDownMenuTextStyle(
                          selectedColor: selectedPPMBand?.color,
                        ),
                        initialSelection: selectedPPMBand,
                      ),
                    TextButton(
                      onPressed: () {
                        debugPrint("Pressed the button");
                        setState(
                          () {
                            clearSelection();
                          },
                        );
                      },
                      style: clearButtonTextStyle(),
                      child: const Text("Clear"),
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
