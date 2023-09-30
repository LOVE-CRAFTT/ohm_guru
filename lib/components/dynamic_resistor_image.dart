import 'package:flutter/material.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/components/dynamic_color_band.dart';

///Background resistor image with multiple [DynamicColorBand] arranged
class DynamicResistorImage extends StatelessWidget {
  const DynamicResistorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        ///Data gotten from fine-tuning
        double bandWidth = (constraints.maxWidth < 458
            ? constraints.maxWidth / 8
            : constraints.maxWidth / 10);
        double bandHeight1 = 160.0;
        double bandHeight2 = 147.0;

        return Stack(
          children: [
            const Positioned(
              child: Image(
                image: AssetImage("assets/resistor.png"),
              ),
            ),
            DynamicColorBand(
              topOffset: 3,
              leftOffset: bandWidth * 1,
              height: bandHeight1,
              selectedBand: selectedBand1,
            ),
            DynamicColorBand(
              topOffset: 3,
              leftOffset: bandWidth * 2,
              height: bandHeight1,
              selectedBand: selectedBand2,
            ),
            if (currentBandType == 5 || currentBandType == 6)
              DynamicColorBand(
                topOffset: (constraints.maxWidth > 293 ? 15 : 10),
                leftOffset: bandWidth * 3,
                height: bandHeight2,
                selectedBand: selectedBand3,
              ),
            DynamicColorBand(
              topOffset: (constraints.maxWidth > 293 ? 15 : 10),
              leftOffset: bandWidth * 3.7,
              height: bandHeight2,
              selectedMultiplier: selectedMultiplierBand,
            ),
            DynamicColorBand(
              topOffset: 3,
              leftOffset: bandWidth * 5,
              height: bandHeight1,
              selectedTolerance: selectedToleranceBand,
            ),
            if (currentBandType == 6)
              DynamicColorBand(
                topOffset: 3,
                leftOffset: bandWidth * 6,
                height: bandHeight1,
                selectedPPM: selectedPPMBand,
              ),
          ],
        );
      }),
    );
  }
}
