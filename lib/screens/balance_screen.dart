import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/others/categories_data.dart';
import 'package:personal_expenses/screens/notifications_screen.dart';
import 'package:personal_expenses/widgets/categori_grid_item.dart';
import 'package:personal_expenses/widgets/credit_card_carouse.dart';
import 'package:personal_expenses/widgets/custom_card.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat numFormat = NumberFormat.decimalPattern('en_us');
    return ListView(
      // primary: false,
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(40),
                radius: 50,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomCard(),
                      ));
                },
                child: Image.asset(
                  'assets/arrows.png',
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.pushNamed(context, NotificationsScreen.routeName);
                },
                icon: const Icon(Icons.notifications),
                color: Theme.of(context).colorScheme.secondary,
                iconSize: 28,
              ),
            ],
          ),
        ),
        Text(
          'Total balance',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          '\$${numFormat.format(4000)}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 32,
              ),
          textAlign: TextAlign.center,
        ),
        const CreditCardCarouse(),
        Card(
          color: Theme.of(context).cardColor,
          clipBehavior: Clip.antiAlias,
          child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'Categories',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10),
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: const Text(
                    //       'View all',
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                GridView(
                  // primary: false,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  children: CATEGORIES_DATA
                      .map(
                        (e) => CategoriGridItem(
                          e['title'] as String,
                          e['icon'] as IconData,
                        ),
                      )
                      .toList(),
                ),
              ]),
        ),
      ],
    );
  }
}
