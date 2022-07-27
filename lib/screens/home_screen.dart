import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/widgets/all_transactions.dart';
import 'package:personal_expenses/widgets/credit_card_carouse.dart';
import 'package:personal_expenses/widgets/expenses.dart';
import 'package:personal_expenses/widgets/home_bar.dart';
import 'package:personal_expenses/widgets/recent_transactions.dart';
import 'package:personal_expenses/widgets/recent_tx_painter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';
  final numFormat = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: HomeBar(),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              'Total balance',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            SizedBox(
              height: size.height * .015,
            ),
            Text(
              '\$${numFormat.format(4000)}',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 24),
            ),
            SizedBox(
              height: size.height * .04,
            ),
            const CreditCardCarouse(
              showIndex: false,
            ),
            Align(
              heightFactor: .55,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: const Expenses(),
              ),
            ),
            Align(
              heightFactor: 1.05,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Stack(
                    children: [
                      Consumer<Transactions>(
                        builder: (ctx, tx, _) {
                          final length = tx.transactions.length;
                          return length == 0
                              ? CustomPaint(
                                  painter: RecentTxPainter(context),
                                  size: Size(
                                    size.width,
                                    size.height * .4,
                                  ),
                                )
                              : CustomPaint(
                                  painter: RecentTxPainter(context),
                                  size: Size(
                                    size.width,
                                    min(
                                      length * size.height * .2 + 40,
                                      size.height * .7,
                                    ),
                                  ),
                                );
                        },
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Recent transactions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AllTransactions(viewAll: true),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'View All',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const RecentTransactions(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
