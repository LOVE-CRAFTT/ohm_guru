import 'package:flutter/material.dart';
import 'package:ohm_guru/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resistance Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          secondary: Color(0xff0058c5),
          // onSurface: Colors.black,
        ),
      ),
      home: const HomePage(title: 'Resistor Color Code Calculator'),
    );
  }
}
