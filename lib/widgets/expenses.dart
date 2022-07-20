import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/widgets/card_shape.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numFormat = NumberFormat.decimalPattern('en_us');
    final size = MediaQuery.of(context).size;
    final expenses = Provider.of<Transactions>(context).getTotalExpenses();
    return Stack(
      children: [
        CustomPaint(
          painter: CardShape(context),
          size: Size(size.width, 130),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * .05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Expense this month',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${numFormat.format((4000 - expenses).round())} saved',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              width: size.width * .2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CircularPercentIndicator(
                radius: 50.0,
                percent: expenses / 4000,
                center: Text(
                  '\$${numFormat.format(expenses.round())}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                curve: Curves.easeInSine,
                lineWidth: 12,
                progressColor: const Color.fromARGB(255, 187, 6, 190),
                // progressColor:
                // Theme.of(context).colorScheme.primary.withOpacity(.6),
                backgroundColor: Theme.of(context).primaryColor,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            SizedBox(
              width: size.width * .05,
            ),
          ],
        ),
      ],
    );
  }
}
