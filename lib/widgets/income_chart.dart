import 'package:flutter/material.dart';

class IncomeChart extends StatelessWidget {
  const IncomeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      margin: const EdgeInsets.all(8),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              padding: const EdgeInsets.all(6),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), // Creates border
                  color: Colors.deepPurpleAccent),
              tabs: const [
                Text('Day'),
                Text('Week'),
                Text('Month'),
                Text('Year'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    child: Text(
                      'Chart',
                    ),
                  ),
                  Text(
                    'Chart',
                  ),
                  Text(
                    'Chart',
                  ),
                  Text(
                    'Chart',
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
