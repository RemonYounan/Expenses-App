import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/widgets/custompainter.dart';

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenses =
        Provider.of<Transactions>(context, listen: false).getTotalExpenses();
    return CustomPaint(
      painter: CardCustomPainter(context),
      size: Size(200, 100),
      child: Container(
        height: 150,
        width: double.infinity,
        child: Center(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Expenses this month',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '\$$expenses',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                width: 90,
              ),
              CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 5.0,
                percent: expenses / 4000,
                center: Text(
                  '\$$expenses',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                progressColor: Theme.of(context).colorScheme.primary,
                // arcType: ArcType.FULL_REVERSED,
                backgroundColor: Theme.of(context).primaryColor,
                // fillColor: Theme.of(context).primaryColor,
                circularStrokeCap: CircularStrokeCap.round,
              )
            ],
          ),
        ),
      ),
    );
  }
}
