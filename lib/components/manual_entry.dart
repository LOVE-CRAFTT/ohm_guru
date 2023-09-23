import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/text_controllers.dart';
import 'package:ohm_guru/utilities/custom_text_input_formatter.dart';

class ManualEntry extends StatelessWidget {
  const ManualEntry({
    super.key,
    required this.onSelectOhmUnit,
    required this.onTextChange,
    required this.constraints,
  });

  final void Function(String?)? onSelectOhmUnit;
  final void Function(String)? onTextChange;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
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
