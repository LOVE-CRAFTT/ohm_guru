import 'package:flutter/material.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/components/dynamic_color_band.dart';

class DynamicResistorImage extends StatelessWidget {
  const DynamicResistorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage("resistor.png"),
            ),
          ),
          DynamicColorBand(
            alignment: const Alignment(-0.55, -0.94),
            height: 160.0,
            selectedBand: selectedBand1,
          ),
          DynamicColorBand(
            alignment: const Alignment(-0.34, -0.94),
            height: 160.0,
            selectedBand: selectedBand2,
          ),
          if (currentBandType == 5 || currentBandType == 6)
            DynamicColorBand(
              alignment: const Alignment(-0.2, -0.84),
              height: 149.0,
              selectedBand: selectedBand3,
            ),
          DynamicColorBand(
            alignment: const Alignment(0.05, -0.84),
            height: 149.0,
            selectedMultiplier: selectedMultiplierBand,
          ),
          DynamicColorBand(
            alignment: const Alignment(0.34, -0.94),
            height: 160.0,
            selectedTolerance: selectedToleranceBand,
          ),
          if (currentBandType == 6)
            DynamicColorBand(
              alignment: const Alignment(0.6, -0.94),
              height: 160.0,
              selectedPPM: selectedPPMBand,
            ),
        ],
      ),
    );
  }
}
