import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';
import 'package:provider/provider.dart';

class WeeksChart extends StatelessWidget {
  const WeeksChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Transactions>(
      builder: (ctx, tx, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: tx.recentWeeksTxValues.map((data) {
            return ChartBar(
              data['week'] as String,
              data['amount'] as double,
              tx.totalWeeksSpending == 0
                  ? 0.0
                  : (data['amount'] as double) / tx.totalWeeksSpending,
            );
          }).toList(),
        );
      },
    );
  }
}
