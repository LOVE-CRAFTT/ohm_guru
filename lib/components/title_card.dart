import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

///Creates a title card at the top with an icon and text identifying what
///type of resistor is being used for the calculation.
///It can extend lengthwise to fill a significant portion of the screen depending on the size of the screen, otherwise
///it takes up a smaller portion

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.bandCount,
    required this.constraints,
  });

  final int bandCount;
  final BoxConstraints constraints;

  ///Returns appropriate margin depending on if screen size is above the largeScreenWidthBreakpoint or not.
  EdgeInsetsGeometry getMargin() {
    if (constraints.maxWidth > largeScreenWidthBreakpoint) {
      return const EdgeInsets.fromLTRB(90, 50, 240, 30);
    } else {
      return const EdgeInsets.fromLTRB(20, 50, 20, 30);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: getMargin(),
      child: ListTile(
        leading: const Image(
          image: AssetImage("assets/icon.png"),
        ),
        title: Text("$bandCount Band Resistor Code Calculator"),
        contentPadding:
            const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
      ),
    );
  }
}
