import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_expenses/widgets/card_shape.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/providers/transactions.dart';

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final expenses = Provider.of<Transactions>(context).getTotalExpenses();
    return CustomPaint(
      painter: CardShape(context),
      size: Size(size.width, size.width),
      child: Container(
        height: size.height * .2,
        width: size.width,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Expenses this month',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${(4000 - expenses).toInt()} saved',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18, color: Colors.grey),
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
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              progressColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Theme.of(context).primaryColor,
              circularStrokeCap: CircularStrokeCap.round,
            )
          ],
        ),
      ),
    );
  }
}
