import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/days_chart.dart';
import 'package:personal_expenses/widgets/months_chart.dart';
import 'package:personal_expenses/widgets/weeks_chart.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .5,
      width: size.width,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              padding: const EdgeInsets.all(6),
              splashBorderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              indicator: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.grey.withOpacity(.4),
                  ],
                ),
              ),
              labelPadding: const EdgeInsets.all(6),
              tabs: const [
                Text('Day'),
                Text('Week'),
                Text('Month'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  DaysChart(),
                  WeeksChart(),
                  MonthsChart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
