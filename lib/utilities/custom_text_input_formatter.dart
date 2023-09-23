import 'package:flutter/services.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final hasOnlyOneDot = newValue.text.split('.').length <= 2;
    final hasOnlyDigitsAndDot =
        newValue.text.replaceAll(RegExp(r'[0-9.]'), '').isEmpty;
    final hasExactDigitsBeforeDecimal =
        newValue.text.split('.')[0].length <= (currentBandType == 4 ? 2 : 3);

    if (hasOnlyOneDot && hasOnlyDigitsAndDot && hasExactDigitsBeforeDecimal) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

CustomTextInputFormatter ensureDigitAndOneDot = CustomTextInputFormatter();
