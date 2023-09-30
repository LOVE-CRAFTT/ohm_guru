import 'package:flutter/services.dart';
import 'package:ohm_guru/logic/resistor_logic.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

///This enforces format for the user input
class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    ///Entry like 1.2...3.2 are not accepted
    ///It checks if splitting at the . results in a list with length <= 2
    final hasOnlyOneDot = newValue.text.split('.').length <= 2;
    if (!hasOnlyOneDot) {
      return oldValue;
    }

    ///It does this by replacing all the digits and dots with a space and checking if the resulting string is empty
    final hasOnlyDigitsAndDot =
        newValue.text.replaceAll(RegExp(r'[0-9.]'), '').isEmpty;

    final beforeDecimal = newValue.text.split('.')[0];

    /// Check if the value before the decimal point is empty or if it's less than or equal to the maximum resistor value
    /// The maximum resistor value depends on the current band type
    final isLessOrEqualToMax = beforeDecimal.isEmpty ||
        (int.tryParse(beforeDecimal) != null &&
            int.parse(beforeDecimal) <=
                (currentBandType == 4
                    ? maxResistorValue4
                    : maxResistorValue5And6));

    /// Split the string before the decimal point into a list of characters
    final beforeDecimalList = beforeDecimal.split('');

    /// Find the index of the first non-zero digit in the list
    var nonZeroIndex =
        beforeDecimalList.indexWhere((element) => element != '0');

    /// If all digits are zero, return the new value
    if (nonZeroIndex == -1) {
      return newValue;
    }

    /// Determine the index from which to check for zeros, based on the current band type
    final indexToCheckForZerosFrom =
        nonZeroIndex + (currentBandType == 4 ? 2 : 3);

    /// Check if all digits after the significant digit are zeros
    final hasOnlyZerosAfterSignificantDigit =
        indexToCheckForZerosFrom >= beforeDecimalList.length ||
            beforeDecimalList
                .sublist(indexToCheckForZerosFrom)
                .every((element) => element == '0');

    /// If the new value contains only digits and a dot, is less than or equal to the maximum resistor value,
    /// and has only zeros after the significant digit, return the new value. Otherwise, return the old value.
    if (hasOnlyDigitsAndDot &&
        isLessOrEqualToMax &&
        hasOnlyZerosAfterSignificantDigit) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

CustomTextInputFormatter ensureDigitsAndOneDot = CustomTextInputFormatter();
