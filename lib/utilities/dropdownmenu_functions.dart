import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/style_constants.dart';

DropdownMenu buildDropDownMenu({
  required BoxConstraints constraints,
  required List<DropdownMenuEntry> dropdownMenuEntries,
  required Text label,
  required TextEditingController controller,
  void Function(Object?)? onSelected,
  BandDetails? selectedBand,
  MultiplierDetails? selectedMultiplier,
  ToleranceDetails? selectedTolerance,
  PPMDetails? selectedPPM,
}) {
  //======
  Color? getLocalColor() {
    if (selectedBand != null) {
      return selectedBand.color;
    } else if (selectedMultiplier != null) {
      return selectedMultiplier.color;
    } else if (selectedTolerance != null) {
      return selectedTolerance.color;
    } else if (selectedPPM != null) {
      return selectedPPM.color;
    } else {
      return null;
    }
  }

  return DropdownMenu(
    dropdownMenuEntries: dropdownMenuEntries,
    label: label,
    width: constraints.maxWidth,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: getLocalColor(),
    ),
    onSelected: onSelected,
    enableSearch: false,
    textStyle: dropDownMenuTextStyle(
      selectedColor: getLocalColor(),
    ),
    controller: controller,
  );
}
