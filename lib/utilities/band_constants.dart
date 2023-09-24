import 'package:flutter/material.dart';

int bandTypesCount = bandTypes.length;
String globalManualResistance = "";

List<Text> bandTypes = const [
  Text("4 Band"),
  Text("5 Band"),
  Text("6 Band"),
];

//=====================
BandDetails? selectedBand1;
BandDetails? selectedBand2;
BandDetails? selectedBand3;
MultiplierDetails? selectedMultiplierBand;
ToleranceDetails? selectedToleranceBand;
PPMDetails? selectedPPMBand;
//=====================

enum BandDetails {
  black("Black", Colors.black, 0, Text("0")),
  brown("Brown", Colors.brown, 1, Text("1")),
  red("Red", Colors.red, 2, Text("2")),
  orange("Orange", Colors.orange, 3, Text("3")),
  yellow(
      "Yellow",
      Colors.yellow,
      4,
      Text(
        "4",
        style: TextStyle(color: Colors.black),
      )),
  green("Green", Colors.green, 5, Text("5")),
  blue("Blue", Colors.blue, 6, Text("6")),
  violet("Violet", Colors.deepPurpleAccent, 7, Text("7")),
  grey("Grey", Colors.grey, 8, Text("8")),
  white(
      "White",
      Colors.white,
      9,
      Text(
        "9",
        style: TextStyle(color: Colors.black),
      ));

  const BandDetails(this.label, this.color, this.value, this.trailing);
  final String label;
  final Color color;
  final num value;
  final Text trailing;
}

enum MultiplierDetails {
  black("Black", Colors.black, 1, Text("×1 Ω")),
  brown("Brown", Colors.brown, 10, Text("×10 Ω")),
  red("Red", Colors.red, 100, Text("×100 Ω")),
  orange("Orange", Colors.orange, 1000, Text("×1 kΩ")),
  yellow(
      "Yellow",
      Colors.yellow,
      10000,
      Text(
        "×10 kΩ",
        style: TextStyle(color: Colors.black),
      )),
  green("Green", Colors.green, 100000, Text("×100 kΩ")),
  blue("Blue", Colors.blue, 1000000, Text("×1 MΩ")),
  violet("Violet", Colors.deepPurpleAccent, 10000000, Text("×10 MΩ")),
  grey("Grey", Colors.grey, 100000000, Text("×100 MΩ")),
  white(
      "White",
      Colors.white,
      1000000000,
      Text(
        "×1 GΩ",
        style: TextStyle(color: Colors.black),
      )),
  gold("Gold", Color(0xffc08327), 0.1, Text("×0.1 Ω")),
  silver("Silver", Color(0xffbfbebf), 0.01, Text("×0.01 Ω"));

  const MultiplierDetails(this.label, this.color, this.value, this.trailing);
  final String label;
  final Color color;
  final num value;
  final Text trailing;
}

enum ToleranceDetails {
  brown("Brown", Colors.brown, 1, Text("±1%")),
  red("Red", Colors.red, 2, Text("±2%")),
  green("Green", Colors.green, 0.5, Text("±0.5%")),
  blue("Blue", Colors.blue, 0.25, Text("±0.25%")),
  violet("Violet", Colors.deepPurpleAccent, 0.1, Text("±0.1%")),
  grey("Grey", Colors.grey, 0.05, Text("±0.05%")),
  gold("Gold", Color(0xffc08327), 5, Text("±5%")),
  silver("Silver", Color(0xffbfbebf), 10, Text("±10%"));

  const ToleranceDetails(this.label, this.color, this.value, this.trailing);
  final String label;
  final Color color;
  final num value;
  final Text trailing;
}

enum PPMDetails {
  brown("Brown", Colors.brown, 100, Text("100 ppm")),
  red("Red", Colors.red, 50, Text("50 ppm")),
  orange("Orange", Colors.orange, 15, Text("15 ppm")),
  yellow(
      "Yellow",
      Colors.yellow,
      25,
      Text(
        "25 ppm",
        style: TextStyle(color: Colors.black),
      )),
  blue("Blue", Colors.blue, 10, Text("10 ppm")),
  violet("Violet", Colors.deepPurpleAccent, 5, Text("5 ppm"));

  const PPMDetails(this.label, this.color, this.value, this.trailing);
  final String label;
  final Color color;
  final num value;
  final Text trailing;
}

var ohmUnits = ["Ω", "kΩ", "MΩ", "GΩ"];
String? selectedOhmUnit = ohmUnits.first;
List<DropdownMenuEntry<String>> buildOhmTypes = [
  for (var ohmUnit in ohmUnits)
    DropdownMenuEntry(
      value: ohmUnit,
      label: ohmUnit,
    ),
];
