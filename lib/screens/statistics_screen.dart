import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/income_chart.dart';
import 'package:personal_expenses/widgets/income_sources.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({Key? key}) : super(key: key);

  static const routeName = '/statistics-screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Text(
              'Statistics',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: TabBar(
                padding: const EdgeInsets.all(15),
                labelStyle:
                    const TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), // Creates border
                    color: Colors.deepPurpleAccent),
                tabs: const [
                  Tab(
                    text: 'Income',
                  ),
                  Tab(
                    text: 'Expense',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    children: [
                      Text(
                        '\$20,998',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'This month total income',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 24, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 200, child: const IncomeChart()),
                      // SizedBox(height: 200, child: const IncomeSources()),
                    ],
                  ),
                  const TransacrionList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
