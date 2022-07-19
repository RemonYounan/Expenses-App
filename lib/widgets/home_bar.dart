import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/screens/notifications_screen.dart';
import 'package:provider/provider.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<CreditCards>(context, listen: false).getName(),
        builder: (context, snapshot) {
          final name = Provider.of<CreditCards>(context, listen: false).name;
          return ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: 50,
            ),
            title: Text(
              'Hello, $name',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24),
            ),
            trailing: IconButton(
              iconSize: 35,
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, NotificationsScreen.routeName);
              },
              icon: const Icon(Icons.notifications),
            ),
          );
        });
  }
}
