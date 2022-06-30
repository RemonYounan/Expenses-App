import 'package:flutter/material.dart';
import 'package:personal_expenses/others/categories_data.dart';
import 'package:personal_expenses/screens/notifications_screen.dart';
import 'package:personal_expenses/widgets/categori_grid_item.dart';
import 'package:personal_expenses/widgets/credit_card_carouse.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ListView(
      // primary: false,
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list_rounded),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NotificationsScreen.routeName);
                  },
                  icon: const Icon(Icons.notifications),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 30,
                ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '\$2,900',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 32,
                ),
            textAlign: TextAlign.center,
          ),
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
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Recent transactions',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View all',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
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
