import 'package:ohm_guru/utilities/band_constants.dart';

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

void manualInputLogic() {
  if (currentBandType == 4) {
  } else {}
}
