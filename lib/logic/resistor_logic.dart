import 'package:ohm_guru/utilities/band_constants.dart';

num? currentBandType;
String? resistance;

void calculateResistance() {
  print(currentBandType);
  print(selectedBand1);
  print(selectedBand2);
  print(selectedBand3);
  print(selectedMultiplierBand);
  print(selectedToleranceBand);
  print(selectedPPMBand);
}

void getResistance() {
  print("In get Resistance");
  resistance = "22.9G Ohms .25% 25ppm";
}
