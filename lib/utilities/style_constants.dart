import 'package:flutter/material.dart';

TextStyle? dropDownMenuTextStyle({Color? selectedColor}) {
  return selectedColor == Colors.white || selectedColor == Colors.yellow
      ? const TextStyle(color: Colors.black)
      : const TextStyle(color: Colors.white);
}

ButtonStyle? clearButtonTextStyle() {
  return TextButton.styleFrom(
    backgroundColor: const Color(0xff0058c5),
    foregroundColor: Colors.white,
    minimumSize: const Size(200.0, 50.0),
  );
}

ButtonStyle? dropDownMenuEntryStyle({Color? color, required String label}) {
  return TextButton.styleFrom(
    backgroundColor: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    foregroundColor:
        label == "White" || label == "Yellow" ? Colors.black : Colors.white,
  );
}
