import 'package:flutter/material.dart';
import 'package:ohm_guru/components/title_card.dart';
import 'package:ohm_guru/components/calculation_page.dart';
import 'package:ohm_guru/constants/band_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resistor Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          secondary: Color(0xff0058c5),
        ),
      ),
      home: const MyHomePage(title: 'Resistor Color Code Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bandCount = 4;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: bandTypesCount,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            TitleCard(
              bandCount: bandCount,
            ),
            const Divider(
              indent: 90.0,
              endIndent: 240.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white54),
              ),
              height: 800.0,
              margin: const EdgeInsets.fromLTRB(90, 40, 240, 10),
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  TabBar(
                    tabs: bandTypesTabs,
                    indicatorColor: Colors.red,
                    onTap: (index) {
                      switch (index) {
                        case 0:
                          bandCount = 4;
                        case 1:
                          bandCount = 5;
                        case 2:
                          bandCount = 6;
                      }
                      setState(() {});
                    },
                  ),
                  const Expanded(
                    flex: 9,
                    child: TabBarView(
                      children: [
                        CalculationPage(
                          tempString: "Resistor Parameters 1",
                        ),
                        CalculationPage(
                          tempString: "Resistor Parameters 2",
                        ),
                        CalculationPage(
                          tempString: "Resistor Parameters 3",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
