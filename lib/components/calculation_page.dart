import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_functions.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/dropdownmenu_functions.dart';
import 'package:ohm_guru/utilities/text_controllers.dart';
import 'package:ohm_guru/components/clear_button.dart';
import 'package:ohm_guru/components/manual_entry.dart';

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
                    buildDropDownMenu(
                      constraints: constraints,
                      dropdownMenuEntries: buildBandColors(),
                      label: const Text("First Band"),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedBand1 = band as BandDetails?;
                          },
                        );
                      },
                      selectedBand: selectedBand1,
                      controller: band1TextController,
                    ),
                    buildDropDownMenu(
                      constraints: constraints,
                      dropdownMenuEntries: buildBandColors(),
                      label: const Text("Second Band"),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedBand2 = band as BandDetails?;
                          },
                        );
                      },
                      selectedBand: selectedBand2,
                      controller: band2TextController,
                    ),
                    if (widget.bandType == 5 || widget.bandType == 6)
                      buildDropDownMenu(
                        constraints: constraints,
                        dropdownMenuEntries: buildBandColors(),
                        label: const Text("Third Band"),
                        onSelected: (band) {
                          setState(
                            () {
                              selectedBand3 = band as BandDetails?;
                            },
                          );
                        },
                        selectedBand: selectedBand3,
                        controller: band3TextController,
                      ),
                    buildDropDownMenu(
                      constraints: constraints,
                      dropdownMenuEntries: buildMultiplierBandColors(),
                      label: const Text("Multiplier"),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedMultiplierBand = band as MultiplierDetails?;
                          },
                        );
                      },
                      selectedMultiplier: selectedMultiplierBand,
                      controller: multiplierBandTextController,
                    ),
                    buildDropDownMenu(
                      constraints: constraints,
                      dropdownMenuEntries: buildToleranceBandColors(),
                      label: const Text("Tolerance"),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedToleranceBand = band as ToleranceDetails?;
                          },
                        );
                      },
                      selectedTolerance: selectedToleranceBand,
                      controller: toleranceBandTextController,
                    ),
                    if (widget.bandType == 6)
                      buildDropDownMenu(
                        constraints: constraints,
                        dropdownMenuEntries: buildPPMBandColors(),
                        label: const Text("PPM"),
                        onSelected: (band) {
                          setState(
                            () {
                              selectedPPMBand = band as PPMDetails?;
                            },
                          );
                        },
                        selectedPPM: selectedPPMBand,
                        controller: ppmBandTextController,
                      ),
                    ManualEntry(
                      onSelectOhmUnit: (unit) {
                        setState(
                          () {
                            selectedOhmUnit = unit;
                          },
                        );
                      },
                    ),
                    ClearButton(
                      clearFunction: () {
                        setState(
                          () {
                            clearSelection();
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Output",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Image(
                          image: AssetImage("assets/resistor.png"),
                        ),
                      ),

                      //TODO: Refactor Alignment widget [dynamicColorBand] so its its own widget, properties would be alignment, color and container height
                      Align(
                        alignment: const Alignment(0, -0.7),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 200.0,
                              width: 13.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Colors.pink,
                                    Colors.pink.shade200,
                                    Colors.pink.shade50,
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Resistor Value:",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
