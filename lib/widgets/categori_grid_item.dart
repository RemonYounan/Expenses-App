import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:provider/provider.dart';

class CategoriGridItem extends StatelessWidget {
  const CategoriGridItem(this.title, this.icon, this.color, {Key? key})
      : super(key: key);
  final String title;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final expense = Provider.of<Transactions>(context, listen: false)
        .getCategoryExpense(title);
    final max =
        Provider.of<Transactions>(context, listen: false).getMaxCatExpense();
    return GridTile(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).cardColor.withAlpha(150),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              icon,
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                expense == 0 ? '\$0' : '-\$${expense.toInt()}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: LinearPercentIndicator(
                  percent: max == 0 ? 0 : expense / max,
                  progressColor: color,
                  backgroundColor: Theme.of(context).cardColor,
                  barRadius: const Radius.circular(15),
                  lineHeight: 6,
                  // center: null,        // edited here
                  curve: Curves.easeIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
