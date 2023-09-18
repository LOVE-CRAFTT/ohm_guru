import 'package:flutter/material.dart';
import 'package:ohm_guru/components/wide_view.dart';
import 'package:ohm_guru/components/narrow_view.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({
    super.key,
    required this.bandType,
    required this.constraints,
  });

  final int bandType;
  final BoxConstraints constraints;

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.constraints.maxWidth > 650) {
      return WideView(widget: widget);
    } else {
      return NarrowView(widget: widget);
    }
  }
}
