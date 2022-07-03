import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/welcom_prefs.dart';
import 'package:personal_expenses/screens/main_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/welcome.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Save your \ntime & less \nExpense',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 58, color: Colors.green.shade300),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).primaryColor),
                // color: Theme.of(context).cardColor,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                // margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).cardColor),
                // color: Theme.of(context).cardColor,
                child: TextButton(
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Provider.of<WelcomePrefs>(context, listen: false)
                        .RemoveFirst();
                    Navigator.pushReplacementNamed(
                        context, MainScreen.routeName);
                  },
                  child: Text(
                    'Start Now',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.8)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
