import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ohm_guru/utilities/band_constants.dart';
import 'package:ohm_guru/utilities/text_controllers.dart';

class ManualEntry extends StatelessWidget {
  const ManualEntry({
    super.key,
    required this.onSelected,
  });

  final void Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            controller: manualInputTextController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              hintText: "Enter value then choose the unit",
              border: OutlineInputBorder(),
            ),
            onChanged: (manualResistance) {
              print(manualResistance);
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownMenu(
              dropdownMenuEntries: buildOhmTypes,
              enableSearch: false,
              initialSelection: selectedOhmUnit,
              onSelected: onSelected,
            ),
          ),
        ),
      ],
    );
  }
}
