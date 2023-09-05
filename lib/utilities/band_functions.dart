import 'package:flutter/material.dart';

List<DropdownMenuEntry<Widget>> buildBandColors(Map<String, int> details) {
  var entries = details.entries.map(
    (e) {
      return DropdownMenuEntry(
        value: Text(e.key),
        label: e.key,
        style: TextButton.styleFrom(
          backgroundColor: getColorFromString(e.key),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        trailingIcon: Text(e.value.toString()),
      );
    },
  ).toList();
  return entries;
}

Color getColorFromString(String colorString) {
  late Color color;
  if (colorString.toLowerCase() == "black") {
    color = Colors.black;
  } else if (colorString.toLowerCase() == "brown") {
    color = Colors.brown;
  } else if (colorString.toLowerCase() == "red") {
    color = Colors.red;
  } else if (colorString.toLowerCase() == "orange") {
    color = Colors.orange;
  } else if (colorString.toLowerCase() == "yellow") {
    color = Colors.yellow;
  } else if (colorString.toLowerCase() == "green") {
    color = Colors.green;
  } else if (colorString.toLowerCase() == "blue") {
    color = Colors.blue;
  } else if (colorString.toLowerCase() == "violet") {
    color = Colors.deepPurpleAccent;
  } else if (colorString.toLowerCase() == "grey") {
    color = Colors.grey;
  } else if (colorString.toLowerCase() == "white") {
    color = Colors.white;
  } else if (colorString.toLowerCase() == "gold") {
    color = const Color(0xffc08327);
  } else if (colorString.toLowerCase() == "silver") {
    color = const Color(0xffbfbebf);
  }
  return color;
}
