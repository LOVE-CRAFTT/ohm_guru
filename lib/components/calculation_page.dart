import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_functions.dart';
import 'package:ohm_guru/utilities/style_constants.dart';

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
  Color? selectedBand1Color;
  Color? selectedBand2Color;
  Color? selectedBand3Color;
  Color? selectedMultiplierBandColor;
  Color? selectedToleranceBandColor;
  Color? selectedPPMBandColor;

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
                        fillColor: selectedBand1Color,
                      ),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedBand1Color = band?.color;
                          },
                        );
                      },
                      enableSearch: false,
                      textStyle: dropDownMenuTextStyle(
                          selectedColor: selectedBand1Color),
                    ),
                    DropdownMenu(
                      dropdownMenuEntries: buildBandColors(),
                      label: const Text("Second Band"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: selectedBand2Color,
                      ),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedBand2Color = band?.color;
                          },
                        );
                      },
                      enableSearch: false,
                      textStyle: dropDownMenuTextStyle(
                          selectedColor: selectedBand2Color),
                    ),
                    if (widget.bandType == 5 || widget.bandType == 6)
                      DropdownMenu(
                        dropdownMenuEntries: buildBandColors(),
                        label: const Text("Third Band"),
                        width: constraints.maxWidth,
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: selectedBand3Color,
                        ),
                        onSelected: (band) {
                          setState(
                            () {
                              selectedBand3Color = band?.color;
                            },
                          );
                        },
                        enableSearch: false,
                        textStyle: dropDownMenuTextStyle(
                            selectedColor: selectedBand3Color),
                      ),
                    DropdownMenu(
                      dropdownMenuEntries: buildMultiplierBandColors(),
                      label: const Text("Multiplier"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: selectedMultiplierBandColor,
                      ),
                      onSelected: (multiplier) {
                        setState(
                          () {
                            selectedMultiplierBandColor = multiplier?.color;
                          },
                        );
                      },
                      enableSearch: false,
                      textStyle: dropDownMenuTextStyle(
                          selectedColor: selectedMultiplierBandColor),
                    ),
                    DropdownMenu(
                      dropdownMenuEntries: buildToleranceBandColors(),
                      label: const Text("Tolerance"),
                      width: constraints.maxWidth,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: selectedToleranceBandColor,
                      ),
                      onSelected: (tolerance) {
                        setState(
                          () {
                            selectedToleranceBandColor = tolerance?.color;
                          },
                        );
                      },
                      enableSearch: false,
                      textStyle: dropDownMenuTextStyle(
                          selectedColor: selectedToleranceBandColor),
                    ),
                    if (widget.bandType == 6)
                      DropdownMenu(
                        dropdownMenuEntries: buildPPMBandColors(),
                        label: const Text("PPM"),
                        width: constraints.maxWidth,
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: selectedPPMBandColor,
                        ),
                        onSelected: (ppm) {
                          setState(
                            () {
                              selectedPPMBandColor = ppm?.color;
                            },
                          );
                        },
                        enableSearch: false,
                        textStyle: dropDownMenuTextStyle(
                            selectedColor: selectedPPMBandColor),
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
