import 'package:flutter/services.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final hasOnlyOneDot = newValue.text.split('.').length <= 2;
    final hasOnlyDigitsAndDot =
        newValue.text.replaceAll(RegExp(r'[0-9.]'), '').isEmpty;

    if (hasOnlyOneDot && hasOnlyDigitsAndDot) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

CustomTextInputFormatter ensureDigitAndOneDot = CustomTextInputFormatter();
