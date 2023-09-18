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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
                  constraints: constraints,
                ),
                Divider(
                  indent: (constraints.maxWidth > 900) ? 90.0 : 20.0,
                  endIndent: (constraints.maxWidth > 900) ? 240.0 : 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white54),
                  ),
                  height: (constraints.maxWidth > 650) ? 800 : 1400,
                  // margin: const EdgeInsets.fromLTRB(90, 40, 240, 10),
                  margin: (constraints.maxWidth > 900)
                      ? const EdgeInsets.fromLTRB(90, 40, 240, 10)
                      : const EdgeInsets.fromLTRB(20, 40, 20, 10),
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      TabBar(
                        tabs: bandTypes,
                        indicatorColor: const Color(0xff0058c5),
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
                      Expanded(
                        flex: 9,
                        child: TabBarView(
                          children: [
                            CalculationPage(
                              bandType: 4,
                              constraints: constraints,
                            ),
                            CalculationPage(
                              bandType: 5,
                              constraints: constraints,
                            ),
                            CalculationPage(
                              bandType: 6,
                              constraints: constraints,
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
      },
    );
  }
}
