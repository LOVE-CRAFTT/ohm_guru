import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/style_constants.dart';

///Returns a dropdownmenu with with the given dropdownmenu entries.
///The constraints passed are essentially the dimensions for half the calculation page space
///The given controller manipulates the text on the dropdownmenu
///A [selectedBand], [selectedMultiplier], [selectedTolerance] or [selectedPPM] enum can be given depending on what the dropdown menu
///would be associated with.
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
  ///Gets the color with which too fill the dropdownmenu when an entry is selected
  ///Can be null
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

      ///When the chosen color is yellow or white, the label text is not visible and this changes the text color to black to make it visible
      ///This is a consistent theme across the project
      labelStyle: TextStyle(
        color:
            getLocalColor() == Colors.white || getLocalColor() == Colors.yellow
                ? Colors.black
                : Colors.white,
      ),
    ),
    onSelected: onSelected,
    enableSearch: false,
    textStyle: dropDownMenuTextStyle(
      selectedColor: getLocalColor(),
    ),
    controller: controller,
  );
}
