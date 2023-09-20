import 'package:ohm_guru/utilities/band_constants.dart';

String? resistance;
num? currentBandType;
num? weightedBand1Value;
num? weightedBand2Value;
num? weightedBand3Value;
num? totalIntermediateResistance;

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

void getResistance() {
  if (currentBandType == 4) {
    if (weightedBand1Value != null && weightedBand2Value != null) {
      totalIntermediateResistance = weightedBand1Value! + weightedBand2Value!;
    }
  } else {
    if (weightedBand1Value != null &&
        weightedBand2Value != null &&
        weightedBand3Value != null) {
      totalIntermediateResistance =
          weightedBand1Value! + weightedBand2Value! + weightedBand3Value!;
    }
  }
  resistance = totalIntermediateResistance?.toString();
}
