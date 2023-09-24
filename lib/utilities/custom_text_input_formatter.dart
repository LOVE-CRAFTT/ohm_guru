import 'package:flutter/services.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final hasOnlyOneDot = newValue.text.split('.').length <= 2;
    final hasOnlyDigitsAndDot =
        newValue.text.replaceAll(RegExp(r'[0-9.]'), '').isEmpty;

    final beforeDecimal = newValue.text.split('.')[0];
    final isLessOrEqualToMax = beforeDecimal.isEmpty ||
        (int.tryParse(beforeDecimal) != null &&
            int.parse(beforeDecimal) <=
                (currentBandType == 4
                    ? maxResistorValue4
                    : maxResistorValue5And6));

    final significantDigits = currentBandType == 4 ? 2 : 3;
    final hasOnlyZerosAfterSignificantDigits =
        beforeDecimal.length <= significantDigits ||
            beforeDecimal
                .substring(significantDigits)
                .split('')
                .every((digit) => digit == '0');

    if (hasOnlyOneDot &&
        hasOnlyDigitsAndDot &&
        isLessOrEqualToMax &&
        hasOnlyZerosAfterSignificantDigits) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

CustomTextInputFormatter ensureDigitsAndOneDot = CustomTextInputFormatter();
