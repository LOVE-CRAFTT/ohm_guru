import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/text_controllers.dart';
import 'package:ohm_guru/utilities/custom_text_input_formatter.dart';

///This combines the text-field for user input in numbers as well as the drop down menu indication the various ohm units
///Specific entry format are in place using the input formatters
class ManualEntry extends StatelessWidget {
  const ManualEntry({
    super.key,
    required this.onSelectOhmUnit,
    required this.onTextChange,
    required this.constraints,
  });

  ///Callback for when a unit is chosen from the dropdownmenu
  final void Function(String?)? onSelectOhmUnit;

  ///Callback for when the text changes
  final void Function(String)? onTextChange;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    ///This calculation maintains the relative dimensions of the text-field and dropdown menu even as the window size changes
    double totalWidth = constraints.maxWidth;
    double textFieldWidth = (2 / 3) * totalWidth;
    double ohmUnitSelectorWidth = (1 / 3) * totalWidth;
    return Row(
      children: [
        SizedBox(
          width: textFieldWidth,
          child: TextField(
            controller: manualInputTextController,
            inputFormatters: [ensureDigitsAndOneDot],
            decoration: const InputDecoration(
              hintText: "Enter value then choose the unit",
              border: OutlineInputBorder(),
            ),
            onChanged: onTextChange,
          ),
        ),
        DropdownMenu(
          dropdownMenuEntries: buildOhmTypes,
          enableSearch: false,
          initialSelection: selectedOhmUnit,
          onSelected: onSelectOhmUnit,
          width: ohmUnitSelectorWidth,
        ),
      ],
    );
  }
}
