import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_functions.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/dropdownmenu_functions.dart';
import 'package:ohm_guru/utilities/text_controllers.dart';
import 'package:ohm_guru/components/action_buttons.dart';
import 'package:ohm_guru/components/manual_entry.dart';
import 'package:ohm_guru/components/dynamic_resistor_image.dart';
import 'package:ohm_guru/components/resistor_value_display.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';

///In the [WideView] the UI is displayed as a row with the user input on the left and the output on the right
class WideView extends StatefulWidget {
  const WideView({
    super.key,
  });

  @override
  State<WideView> createState() => _WideViewState();
}

class _WideViewState extends State<WideView> {
  @override
  void initState() {
    super.initState();

    ///This allows the resistance to be persistent across pages since it uses the same values during the function call
    setState(
      () {
        resistance = setAndGetResistance();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ///Once a band is selected, the corresponding selected band is set
    ///and the resistance variable is set with the [setAndGetResistance] function
    ///This method allows the user to select bands arbitrarily and the value is shown only after required bands are set
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

                    ///Band 1 "Normal band"
                    buildDropDownMenu(
                      constraints: constraints,
                      dropdownMenuEntries: buildBandColors(),
                      label: const Text("First Band"),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedBand1 = band as BandDetails?;
                            resistance = setAndGetResistance();
                          },
                        );
                      },
                      selectedBand: selectedBand1,
                      controller: band1TextController,
                    ),

                    ///Band 2 "Normal band"
                    buildDropDownMenu(
                      constraints: constraints,
                      dropdownMenuEntries: buildBandColors(),
                      label: const Text("Second Band"),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedBand2 = band as BandDetails?;
                            resistance = setAndGetResistance();
                          },
                        );
                      },
                      selectedBand: selectedBand2,
                      controller: band2TextController,
                    ),

                    ///Band 3 "Normal Band", only displays if the currentBandType equals 4 or 5
                    if (currentBandType == 5 || currentBandType == 6)
                      buildDropDownMenu(
                        constraints: constraints,
                        dropdownMenuEntries: buildBandColors(),
                        label: const Text("Third Band"),
                        onSelected: (band) {
                          setState(
                            () {
                              selectedBand3 = band as BandDetails?;
                              resistance = setAndGetResistance();
                            },
                          );
                        },
                        selectedBand: selectedBand3,
                        controller: band3TextController,
                      ),

                    ///Multiplier band
                    buildDropDownMenu(
                      constraints: constraints,
                      dropdownMenuEntries: buildMultiplierBandColors(),
                      label: const Text("Multiplier"),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedMultiplierBand = band as MultiplierDetails?;
                            resistance = setAndGetResistance();
                          },
                        );
                      },
                      selectedMultiplier: selectedMultiplierBand,
                      controller: multiplierBandTextController,
                    ),

                    ///Tolerance Band
                    buildDropDownMenu(
                      constraints: constraints,
                      dropdownMenuEntries: buildToleranceBandColors(),
                      label: const Text("Tolerance"),
                      onSelected: (band) {
                        setState(
                          () {
                            selectedToleranceBand = band as ToleranceDetails?;
                            resistance = setAndGetResistance();
                          },
                        );
                      },
                      selectedTolerance: selectedToleranceBand,
                      controller: toleranceBandTextController,
                    ),

                    ///PPM Band that is drawn only if the currentBandType is 6
                    if (currentBandType == 6)
                      buildDropDownMenu(
                        constraints: constraints,
                        dropdownMenuEntries: buildPPMBandColors(),
                        label: const Text("PPM"),
                        onSelected: (band) {
                          setState(
                            () {
                              selectedPPMBand = band as PPMDetails?;
                              resistance = setAndGetResistance();
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

                            ///recalculates the resistance based on the updated selectedOhmUnit
                            manualInputLogic(globalManualResistance);
                          },
                        );
                      },
                      constraints: constraints,
                      onTextChange: (localManualResistance) {
                        setState(
                          () {
                            globalManualResistance = localManualResistance;
                            manualInputLogic(globalManualResistance);
                          },
                        );
                      },
                    ),
                    ActionButtons(
                      clearFunction: () {
                        setState(
                          () {
                            clearSelection();
                            resistance = setAndGetResistance();
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
                DynamicResistorImage(
                  ///To ensure this is always rebuilt on setState
                  key: ValueKey(DateTime.now()),
                ),
                ResistorValueDisplay(
                  displayResistanceString: resistance,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
