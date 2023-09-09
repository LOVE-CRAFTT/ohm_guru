import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/style_constants.dart';

List<DropdownMenuEntry<BandDetails>> buildBandColors() {
  final List<DropdownMenuEntry<BandDetails>> bandEntries =
      <DropdownMenuEntry<BandDetails>>[];
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

List<DropdownMenuEntry<MultiplierDetails>> buildMultiplierBandColors() {
  final List<DropdownMenuEntry<MultiplierDetails>> bandEntries =
      <DropdownMenuEntry<MultiplierDetails>>[];
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

List<DropdownMenuEntry<ToleranceDetails>> buildToleranceBandColors() {
  final List<DropdownMenuEntry<ToleranceDetails>> bandEntries =
      <DropdownMenuEntry<ToleranceDetails>>[];
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

List<DropdownMenuEntry<PPMDetails>> buildPPMBandColors() {
  final List<DropdownMenuEntry<PPMDetails>> bandEntries =
      <DropdownMenuEntry<PPMDetails>>[];
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

void clearSelection() {
  selectedBand1 = selectedBand2 = selectedBand3 =
      selectedMultiplierBand = selectedToleranceBand = selectedPPMBand = null;
}
