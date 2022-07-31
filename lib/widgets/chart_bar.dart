import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(this.lable, this.amount, this.amountPct, {Key? key})
      : super(key: key);
  final String lable;
  final double amount;
  final double amountPct;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .4,
      width: size.width * .2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .025,
              child: FittedBox(
                child: Text(
                  lable,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            SizedBox(
              height: size.height * .25,
              width: 14,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: amountPct,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            SizedBox(
              height: size.height * .025,
              child: FittedBox(
                child: Text(
                  '\$${amount.toInt()}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
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
