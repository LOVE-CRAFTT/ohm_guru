import 'package:flutter/material.dart';

TextStyle? dropDownMenuTextStyle({Color? selectedColor}) {
  return selectedColor == Colors.white || selectedColor == Colors.yellow
      ? const TextStyle(color: Colors.black)
      : const TextStyle(color: Colors.white);
}
