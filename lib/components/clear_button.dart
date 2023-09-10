import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/style_constants.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    required this.clearFunction,
  });

  final VoidCallback clearFunction;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        debugPrint("Pressed the button");
        clearFunction();
      },
      style: clearButtonTextStyle(),
      child: const Text("Clear"),
    );
  }
}
