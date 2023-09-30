import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/text_controllers.dart';

///Resistance string gotten after the values in the available dropdown menus are set
///Will be null until the available dropdown menus are set
String? resistance;

///The [currentBandType] is set globally to allow
num? currentBandType;
num? weightedBand1Value;
num? weightedBand2Value;
num? weightedBand3Value;
num? multiplierValue;
num? totalIntermediateResistance;
String? fullResistance;

///Combination of the set and getResistance functions
String? setAndGetResistance() {
  setResistance();
  return getResistance();
}

///It gets each user entry and multiplies by their weights depending on resistor type
void setResistance() {
  if (currentBandType == 4) {
    weightedBand1Value =
        selectedBand1 == null ? null : selectedBand1!.value * 10;
    weightedBand2Value = selectedBand2 == null ? null : selectedBand2!.value;
    weightedBand3Value = selectedBand3 == null ? null : 0;
  } else {
    weightedBand1Value =
        selectedBand1 == null ? null : selectedBand1!.value * 100;
    weightedBand2Value =
        selectedBand2 == null ? null : selectedBand2!.value * 10;
    weightedBand3Value = selectedBand3 == null ? null : selectedBand3!.value;
  }
}

///The [fullResistance] is set to null by default then it checks if the necessary bands have been set
///If they have been set then [fullResistance] is set to the display string and the display string is returned
///else null is returned
String? getResistance() {
  fullResistance = null;

  if (currentBandType == 4) {
    if (weightedBand1Value != null &&
        weightedBand2Value != null &&
        selectedMultiplierBand != null &&
        selectedToleranceBand != null) {
      totalIntermediateResistance = weightedBand1Value! + weightedBand2Value!;
      totalIntermediateResistance =
          totalIntermediateResistance! * selectedMultiplierBand!.value;
      fullResistance = convertToDisplayString(
        totalIntermediateResistance!,
        selectedToleranceBand!.trailing.data,
      );
    }
  } else if (currentBandType == 5) {
    if (weightedBand1Value != null &&
        weightedBand2Value != null &&
        weightedBand3Value != null &&
        selectedMultiplierBand != null &&
        selectedToleranceBand != null) {
      totalIntermediateResistance =
          weightedBand1Value! + weightedBand2Value! + weightedBand3Value!;
      totalIntermediateResistance =
          totalIntermediateResistance! * selectedMultiplierBand!.value;
      fullResistance = convertToDisplayString(
        totalIntermediateResistance!,
        selectedToleranceBand!.trailing.data,
      );
    }
  } else {
    if (weightedBand1Value != null &&
        weightedBand2Value != null &&
        weightedBand3Value != null &&
        selectedMultiplierBand != null &&
        selectedToleranceBand != null &&
        selectedPPMBand != null) {
      totalIntermediateResistance =
          weightedBand1Value! + weightedBand2Value! + weightedBand3Value!;
      totalIntermediateResistance =
          totalIntermediateResistance! * selectedMultiplierBand!.value;
      fullResistance = convertToDisplayString(
        totalIntermediateResistance!,
        selectedToleranceBand!.trailing.data,
        selectedPPMBand!.trailing.data,
      );
    }
  }

  return fullResistance;
}

///Converts the user selected input to the display string depending on the provided input to the function
String convertToDisplayString(num calculatedResistance,
    [String? currentToleranceString = "", String? currentPPMString = ""]) {
  ///truncatedResistance is used to allow for clean length calculation
  num truncatedResistance = calculatedResistance.truncate();
  String stringWorker1 = truncatedResistance.toString();
  num countWorker = stringWorker1.length;

  if (countWorker >= 4 && countWorker <= 6) {
    calculatedResistance /= 1000;
    stringWorker1 = calculatedResistance.toString();
    return "$stringWorker1 kΩ ${currentToleranceString!} ${currentPPMString!}";
  } else if (countWorker >= 7 && countWorker <= 9) {
    calculatedResistance /= 1000000;
    stringWorker1 = calculatedResistance.toString();
    return "$stringWorker1 MΩ ${currentToleranceString!} ${currentPPMString!}";
  } else if (countWorker >= 10 && countWorker <= 12) {
    calculatedResistance /= 1000000000;
    stringWorker1 = calculatedResistance.toString();
    return "$stringWorker1 GΩ ${currentToleranceString!} ${currentPPMString!}";
  } else {
    ///This means the value is either a decimal or below 1000
    ///Notice that the original [calculatedResistance] is used
    return "${printValueIfDecimal(testResistance: calculatedResistance)} Ω ${currentToleranceString!} ${currentPPMString!}";
  }
}

///Handles display of decimals
String printValueIfDecimal({required num testResistance}) {
  ///If testResistance is a whole number
  if (testResistance % 1 == 0) {
    return testResistance.toString();
  } else {
    ///If it has a non zero second decimal place then display it else use a single digit after decimal
    return testResistance * 100 % 10 <= 0.00001
        ? testResistance.toStringAsFixed(1)
        : testResistance.toStringAsFixed(2);
  }
}

///Manual Input Logic variables
num? num1;
num? num2;
num? num3;
num? multiplierNum;
num? userEntryNum;
late bool isDecimal;
late List<String> userEntryList;
late List<String> decimalSplit;
late List<String> beforeDecimal;
late List<String> afterDecimal;

///Logic for manual resistance text entry
void manualInputLogic(String entry) {
  entry = removeLeadingZeros(entry);

  ///[userEntryNum] equals the number entered by the user taking the selectedOhmUnit into consideration
  ///can also be null
  userEntryNum = entry.isNotEmpty && entry != "."
      ? num.parse(entry) * ohmMap[selectedOhmUnit]!
      : null;
  isDecimal = entry.contains('.');
  userEntryList = entry.split('');
  decimalSplit = entry.split('.');
  beforeDecimal = decimalSplit.first.split('');
  afterDecimal = decimalSplit.last.split('');

  if (isDecimal) {
    decimalCalculation();
  } else {
    nonDecimalCalculation();
  }

  clearTextIfOverValueOrEmptyEntry();
}

void decimalCalculation() {
  ///This means the user has entered a single dot.
  if (userEntryNum == null) {
    userEntryNum = null;
    userEntryList = [];
    nonDecimalCalculation();
  } else {
    int remaining;
    int count = 0;

    ///The remaining number of digits to get to the maximum number of significant digits is determined
    ///If the remaining digits are more than 0, digits after the decimal are moved "forward" to fill the space
    ///Digits after the decimal are limited to 2 because our set of multipliers bottoms out at 0.01
    ///The newUserEntryNum is set with the new values before the decimal
    ///The user entry list becomes the list of values before the decimal with the leading zeros removed
    ///and the non decimal calculation is run again
    ///
    ///
    /// Example: user enters 0.243 in 4 band and ohmUnit set to kΩ
    /// entry is "cleaned" to .243 at the remove leading zeros section
    /// user entry is not equals null so we're in this section
    /// remaining = 1
    /// 2 and 4 are moved to before decimal position (while beforeDecimal.length <= remaining && afterDecimal.isNotEmpty)
    /// userEntryNum is set to 0.24 * 1000 = 240
    /// userEntryList is set to [2, 4]
    /// non decimal calculation is run with those values
    /// multiplier num is set to 10 since 24 * 10 - 240 < 0.0001
    remaining = (currentBandType == 4 ? 2 : 3) -
        (beforeDecimal.isEmpty ? 1 : beforeDecimal.length);
    if (remaining.isNegative) remaining = 0;
    if (afterDecimal.length > 2) {
      afterDecimal = afterDecimal.sublist(0, 2);
    }
    if (remaining > 0) {
      while (beforeDecimal.length <= remaining && afterDecimal.isNotEmpty) {
        beforeDecimal.add(afterDecimal.first);
        afterDecimal.removeAt(0);
        count++;
      }
      userEntryNum = getNewUserEntryNum(count);
      removeLeadingZerosList(beforeDecimal);
      userEntryList = beforeDecimal;
      nonDecimalCalculation();
    } else {
      ///If it is not greater than 0 then it is sufficient for the calculation and values after the decimal are discarded
      userEntryNum = getNewUserEntryNum(0);
      removeLeadingZerosList(beforeDecimal);
      userEntryList = beforeDecimal;
      nonDecimalCalculation();
    }
  }
}

void nonDecimalCalculation() {
  ///Take the first two significant digits if they're available, and since the user can only enter zeros after these digits no entry is missed
  ///num2 take precedence over num 1 in the case of less than 2 value
  ///
  /// E.g if 29000 is entered, num1 = 2, num2 = 9;
  /// if 6 is entered num1 = 0, num2 = 6
  if (currentBandType == 4) {
    if (userEntryList.length >= 2) {
      num1 = int.parse(userEntryList[0]);
      num2 = int.parse(userEntryList[1]);
      num3 = null;
    } else {
      num1 = userEntryList.isEmpty ? null : 0;
      num2 = userEntryList.isEmpty ? null : int.parse(userEntryList[0]);
      num3 = null;
    }
  } else {
    ///Take the first two significant digits if they're available, and since the user can only enter zeros after these digits no entry is missed
    ///num3 takes precedence over num2 which take precedence over num1 in the case of less than 3 value
    ///
    /// E.g if 293000 is entered, num1 = 2, num2 = 9, num3 = 3;
    /// if 67 is entered num1 = 0, num2 = 6, num3 = 7;
    /// if 8 is entered num1 = 0, num2 = 0 , num3 = 8
    if (userEntryList.length >= 3) {
      num1 = int.parse(userEntryList[0]);
      num2 = int.parse(userEntryList[1]);
      num3 = int.parse(userEntryList[2]);
    } else {
      num1 = userEntryList.isEmpty ? null : 0;
      num2 = userEntryList.isEmpty
          ? null
          : (userEntryList.length == 2 ? int.parse(userEntryList[0]) : 0);
      num3 = userEntryList.isEmpty
          ? null
          : (userEntryList.length == 2
              ? int.parse(userEntryList[1])
              : int.parse(userEntryList[0]));
    }
  }
  setMultiplierNum();
  setNumToNullIfOverValue();
  setSelectedBands();
}

String removeLeadingZeros(String userEntry) {
  var workerList = userEntry.split('');
  String workerString = "";
  for (var entry in workerList) {
    if (entry == '0') {
      workerList = workerList.sublist(1);
    } else {
      break;
    }
  }
  for (var entry in workerList) {
    workerString += entry;
  }
  return workerString;
}

List<String> removeLeadingZerosList(List<String> userEntry) {
  for (var entry in userEntry) {
    if (entry == '0') {
      userEntry = userEntry.sublist(1);
    } else {
      break;
    }
  }
  return userEntry;
}

///the new userEntryNum is gotten depending on the digit after the decimal that was last moved "forward"
num getNewUserEntryNum(int endIndex) {
  var positionOfDot = userEntryList.indexOf('.');
  var cutOffIndex = positionOfDot + endIndex;

  ///in the sublist(int start, [int? end]) function, end is not inclusive
  var workerList = userEntryList.sublist(0, cutOffIndex + 1);
  var workerString = "";
  for (var entry in workerList) {
    workerString += entry;
  }
  var workerNum = num.parse(workerString);
  return workerNum * ohmMap[selectedOhmUnit]!;
}

///The num variables are weighed and added
///Multiplier num is set as the first [multipliers] that when multiplied with the total gives the userEntryNum
///The method used is to account for floating point accuracy
void setMultiplierNum() {
  num workerNum1;
  num workerNum2;
  num workerNum3;
  num total;
  if (currentBandType == 4) {
    workerNum1 = num1 == null ? 0 : num1! * 10;
    workerNum2 = num2 == null ? 0 : num2!;
    workerNum3 = 0;
  } else {
    workerNum1 = num1 == null ? 0 : num1! * 100;
    workerNum2 = num2 == null ? 0 : num2! * 10;
    workerNum3 = num3 ?? 0;
  }
  total = workerNum1 + workerNum2 + workerNum3;

  multiplierNum = (userEntryNum != null &&
          userEntryNum! <=
              (currentBandType == 4
                  ? maxResistorValue4
                  : maxResistorValue5And6))
      ? multipliers.firstWhere(
          (multiple) => (total * multiple - userEntryNum!).abs() < 1e-10)
      : null;
}

void clearRelevantText() {
  band1TextController.clear();
  band2TextController.clear();
  band3TextController.clear();
  multiplierBandTextController.clear();
}

void setNumToNullIfOverValue() {
  if (userEntryNum != null &&
      userEntryNum! >
          (currentBandType == 4 ? maxResistorValue4 : maxResistorValue5And6)) {
    num1 = num2 = num3 = multiplierNum = null;
  }
}

void clearTextIfOverValueOrEmptyEntry() {
  if (userEntryList.isEmpty ||
      userEntryNum != null &&
          userEntryNum! >
              (currentBandType == 4
                  ? maxResistorValue4
                  : maxResistorValue5And6)) {
    clearRelevantText();
  }
}

///Once the num variables are selected, the relevant corresponding selected bands are set and the corresponding texts are also set
void setSelectedBands() {
  selectedBand1 = (num1 == null)
      ? null
      : BandDetails.values.firstWhere((band) => band.value == num1);
  selectedBand2 = (num2 == null)
      ? null
      : BandDetails.values.firstWhere((band) => band.value == num2);
  selectedBand3 = (num3 == null)
      ? null
      : BandDetails.values.firstWhere((band) => band.value == num3);
  selectedMultiplierBand = (multiplierNum == null)
      ? null
      : MultiplierDetails.values
          .firstWhere((multiplier) => multiplier.value == multiplierNum);

  if (selectedBand1 != null) {
    band1TextController.text = selectedBand1!.label;
  }
  if (selectedBand2 != null) {
    band2TextController.text = selectedBand2!.label;
  }
  if (selectedBand3 != null) {
    band3TextController.text = selectedBand3!.label;
  }
  if (selectedMultiplierBand != null) {
    multiplierBandTextController.text = selectedMultiplierBand!.label;
  }
}

List<num> multipliers = [
  0.01,
  0.1,
  1,
  10,
  100,
  1000,
  10000,
  100000,
  1000000,
  10000000,
  100000000,
  1000000000,
];

Map<String?, num> ohmMap = {
  "Ω": 1,
  "kΩ": 1000,
  "MΩ": 1000000,
  "GΩ": 1000000000,
};
