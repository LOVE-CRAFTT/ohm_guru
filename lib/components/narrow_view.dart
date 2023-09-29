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

class NarrowView extends StatefulWidget {
  const NarrowView({
    super.key,
  });

  @override
  State<NarrowView> createState() => _NarrowViewState();
}

class _NarrowViewState extends State<NarrowView> {
  @override
  void initState() {
    super.initState();
    resistance = setAndGetResistance();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            resistance = setAndGetResistance();
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
                            resistance = setAndGetResistance();
                          },
                        );
                      },
                      selectedBand: selectedBand2,
                      controller: band2TextController,
                    ),
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
                      purchaseFunction: () {},
                      constraints: constraints,
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
