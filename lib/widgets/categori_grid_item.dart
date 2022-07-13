import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:provider/provider.dart';

class CategoriGridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  CategoriGridItem(this.title, this.icon, {Key? key}) : super(key: key);

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
        child: Card(
          elevation: 20,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 50,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                '-$expense',
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
                  progressColor: Theme.of(context).colorScheme.primary,
                  barRadius: Radius.circular(15),
                  lineHeight: 6,
                  center: null,
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
