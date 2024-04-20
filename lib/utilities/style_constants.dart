import 'package:flutter/material.dart';

///When an entry is chosen this enables the corresponding text to be visible if the background is white or yellow
TextStyle? dropDownMenuTextStyle({Color? selectedColor}) {
  return selectedColor == Colors.white || selectedColor == Colors.yellow
      ? const TextStyle(color: Colors.black)
      : const TextStyle(color: Colors.white);
}

///blue clear Button to follow overarching theme
ButtonStyle? clearButtonTextStyle() {
  return TextButton.styleFrom(
    backgroundColor: const Color(0xff0058c5),
    foregroundColor: Colors.white,
    minimumSize: const Size(150.0, 50.0),
  );
}

///red purchase Button for enhanced visibility
ButtonStyle? purchaseButtonTextStyle() {
  return TextButton.styleFrom(
    backgroundColor: const Color(0xffc50058),
    foregroundColor: Colors.white,
    minimumSize: const Size(150.0, 50.0),
  );
}

///Rounded rectangle with the foreground color set to black if the entry label is white or yellow (also for visibility)
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
