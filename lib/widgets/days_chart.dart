import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';
import 'package:provider/provider.dart';

class DaysChart extends StatelessWidget {
  const DaysChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Transactions>(
      builder: (ctx, tx, _) {
        return ListView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          children: tx.recentDaysTxValues.map((data) {
            return ChartBar(
              data['day'] as String,
              data['amount'] as double,
              tx.totalDaysSpending == 0
                  ? 0.0
                  : (data['amount'] as double) / tx.totalDaysSpending,
            );
          }).toList(),
        );
      },
    );
  }
}
