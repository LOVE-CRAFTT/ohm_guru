import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

///Single band representing bands of a resistor.
///Consists of a long container with either a color gradient or solid color. And a small box of variable width at the end with a solid color
///Synchronises with a dropdown menu, so if a value is selected from the dropdown the color is updated
class DynamicColorBand extends StatelessWidget {
  const DynamicColorBand({
    super.key,
    required this.leftOffset,
    required this.height,
    this.selectedBand,
    this.selectedMultiplier,
    this.selectedTolerance,
    this.selectedPPM,
    required this.topOffset,
  });

  final double leftOffset;
  final double topOffset;
  final double height;
  final BandDetails? selectedBand;
  final MultiplierDetails? selectedMultiplier;
  final ToleranceDetails? selectedTolerance;
  final PPMDetails? selectedPPM;

  ///Gets the color with which too fill the band when an entry is selected
  ///Can be null
  Color? getLocalColor() {
    if (selectedBand != null) {
      return selectedBand?.color;
    } else if (selectedMultiplier != null) {
      return selectedMultiplier?.color;
    } else if (selectedTolerance != null) {
      return selectedTolerance?.color;
    } else if (selectedPPM != null) {
      return selectedPPM?.color;
    } else {
      return null;
    }
  }

  ///gets the corresponding text at the end of the band
  Text? getLocalTrailing() {
    if (selectedBand != null) {
      return selectedBand?.trailing;
    } else if (selectedMultiplier != null) {
      return selectedMultiplier?.trailing;
    } else if (selectedTolerance != null) {
      return selectedTolerance?.trailing;
    } else if (selectedPPM != null) {
      return selectedPPM?.trailing;
    } else {
      return null;
    }
  }

  ///Allows for long text in the trailing section to be shown
  double? getTagWidth() {
    if (selectedMultiplier != null || selectedPPM != null) {
      return 60.0;
    } else if (selectedTolerance != null) {
      return 50.0;
    } else {
      return 30.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topOffset,
      left: leftOffset,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: height,
            width: 10.0,
            decoration: BoxDecoration(
              /// if there is an available color there is a gradient
              gradient: getLocalColor() != null
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        getLocalColor()!.withAlpha(255),
                        getLocalColor()!.withAlpha(200),
                        getLocalColor()!.withAlpha(190),
                      ],
                    )
                  : null,

              ///if there is not an available chosen color then it is a solid default color
              color: getLocalColor() == null ? const Color(0xffc5c5c5) : null,
            ),
          ),
          Container(
            height: 25,
            width: getTagWidth(),
            decoration: BoxDecoration(
              color: getLocalColor() ?? const Color(0xffc5c5c5),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: getLocalTrailing(),
            ),
          ),
        ],
      ),
    );
  }
}
