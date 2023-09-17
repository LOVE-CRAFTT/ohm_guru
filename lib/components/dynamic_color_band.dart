import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

class DynamicColorBand extends StatelessWidget {
  const DynamicColorBand({
    super.key,
    required this.alignment,
    required this.height,
    required this.width,
    this.selectedBand,
    this.selectedMultiplier,
    this.selectedTolerance,
    this.selectedPPM,
  });

  final Alignment alignment;
  final double height;
  final double width;
  final BandDetails? selectedBand;
  final MultiplierDetails? selectedMultiplier;
  final ToleranceDetails? selectedTolerance;
  final PPMDetails? selectedPPM;

  //======
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

  //======
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

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              // gradient: ,
              gradient: getLocalColor() != null
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        getLocalColor()!,
                        getLocalColor()!.withAlpha(58),
                      ],
                    )
                  : null,
              color: getLocalColor() == null ? const Color(0xffc5c5c5) : null,
            ),
          ),
          Container(
            height: 30,
            width: 50,
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
