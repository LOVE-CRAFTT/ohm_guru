import 'package:flutter/material.dart';

class DynamicColorBand extends StatelessWidget {
  const DynamicColorBand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200.0,
            width: 13.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.pink,
                  Colors.pink.shade200,
                  Colors.pink.shade50,
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ],
      ),
    );
  }
}
