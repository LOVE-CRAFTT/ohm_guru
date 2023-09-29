import 'package:flutter/material.dart';
import 'package:ohm_guru/utilities/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri resistorPurchasePage =
    Uri.parse('https://robo.com.cy/products/resistor-kit-560-pcs-1-4w');

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.clearFunction,
  });

  final VoidCallback clearFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              clearFunction();
            },
            style: clearButtonTextStyle(),
            child: const Text("Clear"),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextButton(
            onPressed: launchPurchasePage,
            style: purchaseButtonTextStyle(),
            child: const Text("Purchase"),
          ),
        ),
      ],
    );
  }
}

Future<void> launchPurchasePage() async {
  if (!await launchUrl(resistorPurchasePage)) {
    throw Exception('Could not launch page');
  }
}
