import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/text_controllers.dart';

String? resistance;
num? currentBandType;
num? weightedBand1Value;
num? weightedBand2Value;
num? weightedBand3Value;
num? multiplierValue;
num? totalIntermediateResistance;
String? fullResistance;

String? setAndGetResistance() {
  setResistance();
  return getResistance();
}

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

String convertToDisplayString(num calculatedResistance,
    [String? currentToleranceString = "", String? currentPPMString = ""]) {
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
    return "${printValueIfDecimal(testResistance: calculatedResistance)} Ω ${currentToleranceString!} ${currentPPMString!}";
  }
}

String printValueIfDecimal({required num testResistance}) {
  if (testResistance % 1 == 0) {
    return testResistance.toString();
  } else {
    return testResistance * 100 % 10 <= 0.00001
        ? testResistance.toStringAsFixed(1)
        : testResistance.toStringAsFixed(2);
  }
}

void manualInputLogic(String entry) {
  bool isDecimal = entry.contains('.');
  num? userEntryNum =
      entry.isNotEmpty ? num.parse(entry) * ohmMap[selectedOhmUnit]! : null;
  List<String> userEntryList = entry.split('');
  num? num1;
  num? num2;
  num? num3;
  num? multiplierNum;
  //=====
  void clearRelevantText() {
    band1TextController.clear();
    band2TextController.clear();
    band3TextController.clear();
    multiplierBandTextController.clear();
  }

  //=====
  void setNumToNullIfOverValue() {
    if (userEntryNum != null &&
        userEntryNum >
            (currentBandType == 4
                ? maxResistorValue4
                : maxResistorValue5And6)) {
      num1 = num2 = num3 = multiplierNum = null;
    }
  }

  //=====
  void clearTextIfOverValueOrEmptyEntry() {
    if (entry.isEmpty ||
        userEntryNum != null &&
            userEntryNum >
                (currentBandType == 4
                    ? maxResistorValue4
                    : maxResistorValue5And6)) {
      clearRelevantText();
    }
  }

  //=====
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
  }

  //=====
  void setMultiplierNum() {
    multiplierNum = userEntryNum != null
        ? multipliers.lastWhere((multiple) => userEntryNum % multiple == 0)
        : null;
  }

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
    setMultiplierNum();

    setNumToNullIfOverValue();
    setSelectedBands();
  } else {
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
    setMultiplierNum();

    setNumToNullIfOverValue();
    setSelectedBands();
  }

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
  clearTextIfOverValueOrEmptyEntry();
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
  1000000000
];

Map<String?, num> ohmMap = {
  "Ω": 1,
  "kΩ": 1000,
  "MΩ": 1000000,
  "GΩ": 1000000000,
};
