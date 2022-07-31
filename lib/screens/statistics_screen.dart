import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/all_transactions.dart';
import 'package:personal_expenses/widgets/chart.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({Key? key}) : super(key: key);

  static const routeName = '/statistics-screen';
  final numFormat = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Statistics',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                splashBorderRadius: BorderRadius.circular(15),
                unselectedLabelColor: Colors.grey,
                padding: const EdgeInsets.all(8),
                labelStyle: Theme.of(context).textTheme.titleLarge,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // Creates border
                  color: Colors.deepPurpleAccent,
                ),
                tabs: const [
                  Tab(
                    text: 'Income',
                  ),
                  Tab(
                    text: 'Expense',
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Text(
                          '\$${numFormat.format(2500)}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 26),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'This month total income',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        const Chart(),
                      ],
                    ),
                    AllTransactions(viewAll: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
