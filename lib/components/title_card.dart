import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.bandCount,
    required this.constraints,
  });

  final int bandCount;
  final BoxConstraints constraints;

  EdgeInsetsGeometry getMargin() {
    if (constraints.maxWidth > 900) {
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
          image: AssetImage("icon.png"),
        ),
        title: Text("$bandCount Band Resistor Code Calculator"),
        contentPadding:
            const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
      ),
    );
  }
}
