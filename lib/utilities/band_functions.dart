import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

List<DropdownMenuEntry<BandDetails>> buildBandColors() {
  final List<DropdownMenuEntry<BandDetails>> bandEntries =
      <DropdownMenuEntry<BandDetails>>[];
  for (final BandDetails color in BandDetails.values) {
    bandEntries.add(
      DropdownMenuEntry(
        value: color,
        label: color.label,
        style: TextButton.styleFrom(
          backgroundColor: color.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          foregroundColor: color.label == "White" || color.label == "Yellow"
              ? Colors.black
              : Colors.white,
        ),
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
        style: TextButton.styleFrom(
          backgroundColor: color.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          foregroundColor: color.label == "White" || color.label == "Yellow"
              ? Colors.black
              : Colors.white,
        ),
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
        style: TextButton.styleFrom(
          backgroundColor: color.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          foregroundColor: color.label == "White" || color.label == "Yellow"
              ? Colors.black
              : Colors.white,
          enableFeedback: false,
        ),
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
        style: TextButton.styleFrom(
          backgroundColor: color.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          foregroundColor: color.label == "White" || color.label == "Yellow"
              ? Colors.black
              : Colors.white,
        ),
        trailingIcon: color.trailing,
      ),
    );
  }
  return bandEntries;
}
