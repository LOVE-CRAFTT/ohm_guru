import 'package:flutter/material.dart';
import 'package:ohm_guru/components/title_card.dart';
import 'package:ohm_guru/components/calculation_page.dart';
import 'package:ohm_guru/utilities/band_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bandCount = 4;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: bandTypesCount,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            widget.title,
          ),
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
                    tabs: bandTypes,
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
                          bandType: 4,
                        ),
                        CalculationPage(
                          bandType: 5,
                        ),
                        CalculationPage(
                          bandType: 6,
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
