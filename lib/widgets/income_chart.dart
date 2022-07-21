import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart.dart';

class IncomeChart extends StatelessWidget {
  const IncomeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 300,
      width: size.width,
      color: Theme.of(context).cardColor,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              padding: const EdgeInsets.all(6),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16), // Creates border
                color: Colors.deepPurpleAccent,
              ),
              tabs: const [
                Text('Day'),
                Text('Week'),
                Text('Month'),
                Text('Year'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TxChart(),
                  Center(
                    child: Text(
                      'Chart',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Chart',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Chart',
                      style: Theme.of(context).textTheme.titleLarge,
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
