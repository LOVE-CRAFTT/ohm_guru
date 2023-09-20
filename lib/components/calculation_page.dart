import 'package:flutter/material.dart';
import 'package:ohm_guru/components/wide_view.dart';
import 'package:ohm_guru/components/narrow_view.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';

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
    currentBandType = bandType;

    if (constraints.maxWidth > 650) {
      return WideView(
        bandType: bandType,
      );
    } else {
      return NarrowView(
        bandType: bandType,
      );
    }
  }
}
