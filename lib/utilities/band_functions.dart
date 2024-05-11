import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/style_constants.dart';
import 'package:ohm_guru/utilities/text_controllers.dart';

///Returns a list of dropdownmenu entries with a BandDetails enum as the "seed"
List<DropdownMenuEntry<BandDetails>> buildBandColors() {
  final List<DropdownMenuEntry<BandDetails>> bandEntries = [];
  for (final BandDetails color in BandDetails.values) {
    bandEntries.add(
      DropdownMenuEntry(
        value: color,
        label: color.label,
        style: dropDownMenuEntryStyle(color: color.color, label: color.label),
        trailingIcon: color.trailing,
      ),
    );
  }
  return bandEntries;
}

///Returns a list of dropdownmenu entries with a MultiplierDetails enum as the "seed"
List<DropdownMenuEntry<MultiplierDetails>> buildMultiplierBandColors() {
  final List<DropdownMenuEntry<MultiplierDetails>> bandEntries = [];
  for (final MultiplierDetails color in MultiplierDetails.values) {
    bandEntries.add(
      DropdownMenuEntry(
        value: color,
        label: color.label,
        style: dropDownMenuEntryStyle(color: color.color, label: color.label),
        trailingIcon: color.trailing,
      ),
    );
  }
  return bandEntries;
}

///Returns a list of dropdownmenu entries with a ToleranceDetails enum as the "seed"
List<DropdownMenuEntry<ToleranceDetails>> buildToleranceBandColors() {
  final List<DropdownMenuEntry<ToleranceDetails>> bandEntries = [];
  for (final ToleranceDetails color in ToleranceDetails.values) {
    bandEntries.add(
      DropdownMenuEntry(
        value: color,
        label: color.label,
        style: dropDownMenuEntryStyle(color: color.color, label: color.label),
        trailingIcon: color.trailing,
      ),
    );
  }
  return bandEntries;
}

///Returns a list of dropdownmenu entries with a PPMDetails enum as the "seed"
List<DropdownMenuEntry<PPMDetails>> buildPPMBandColors() {
  final List<DropdownMenuEntry<PPMDetails>> bandEntries = [];
  for (final PPMDetails color in PPMDetails.values) {
    bandEntries.add(
      DropdownMenuEntry(
        value: color,
        label: color.label,
        style: dropDownMenuEntryStyle(color: color.color, label: color.label),
        trailingIcon: color.trailing,
      ),
    );
  }
  return bandEntries;
}

///Sets the values of the selected bands to null, clears the screen, clears the text-field and returns the [selectedOhmUnit] to default Ω
void clearSelection() {
  selectedBand1 = selectedBand2 = selectedBand3 =
      selectedMultiplierBand = selectedToleranceBand = selectedPPMBand = null;
  band1TextController.clear();
  band2TextController.clear();
  band3TextController.clear();
  multiplierBandTextController.clear();
  toleranceBandTextController.clear();
  ppmBandTextController.clear();
  manualInputTextController.clear();

  //=====Reset ohm type to Ω
  selectedOhmUnit = ohmUnits.first;
}
