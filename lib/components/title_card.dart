import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.bandCount,
  });

  final int bandCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(90, 50, 240, 30),
      child: ListTile(
        leading: const Icon(
          Icons.man,
          size: 50.0,
        ),
        title: Text("$bandCount Band Resistor Code Calculator"),
        contentPadding:
            const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
      ),
    );
  }
}
