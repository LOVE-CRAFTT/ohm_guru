import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/style_constants.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.clearFunction,
    required this.purchaseFunction,
    required this.constraints,
  });

  final VoidCallback clearFunction;
  final VoidCallback purchaseFunction;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              clearFunction();
            },
            style: clearButtonTextStyle(),
            child: const Text("Clear"),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              purchaseFunction();
            },
            style: purchaseButtonTextStyle(),
            child: const Text("Purchase"),
          ),
        ),
      ],
    );
  }
}
