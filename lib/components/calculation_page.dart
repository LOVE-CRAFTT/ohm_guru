import 'package:flutter/material.dart';
import 'package:ohm_guru/components/wide_view.dart';
import 'package:ohm_guru/components/narrow_view.dart';

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
    if (constraints.maxWidth > 650) {
      return WideView(
        bandType: bandType,
        constraints: constraints,
      );
    } else {
      return NarrowView(
        bandType: bandType,
        constraints: constraints,
      );
    }
  }
}
