import 'package:flutter/material.dart';
import 'package:ohm_guru/components/wide_view.dart';
import 'package:ohm_guru/components/narrow_view.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

///The "main" page of the calculation, it can be in either wide-view or narrow-view depending on the screen size of the display window
class CalculationPage extends StatelessWidget {
  const CalculationPage({
    super.key,
    required this.bandType,
    required this.constraints,
  });

  final int bandType;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    ///The [currentBandType] is set as the first thing even before the page is built
    currentBandType = bandType;

    if (constraints.maxWidth > smallScreenWidthBreakpoint) {
      return const WideView();
    } else {
      return const NarrowView();
    }
  }
}
