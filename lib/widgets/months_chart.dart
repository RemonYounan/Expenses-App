import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';
import 'package:provider/provider.dart';

class MonthsChart extends StatelessWidget {
  const MonthsChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<Transactions>(
      builder: (ctx, tx, _) {
        return ListView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          children: tx.recentMonthsTxValues.map((data) {
            return SizedBox(
              width: size.width * .18,
              child: ChartBar(
                data['month'] as String,
                data['amount'] as double,
                tx.totalMonthsSpending == 0
                    ? 0.0
                    : (data['amount'] as double) / tx.totalMonthsSpending,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
