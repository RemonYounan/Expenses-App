import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/welcome.png',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Save your \ntime & less \nExpense',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 55,
                      color: Colors.green.shade300,
                    ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: mediaQuery.size.width * .5,
                clipBehavior: Clip.antiAlias,
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
                height: 90,
                width: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    color: Theme.of(context).cardColor),
                // color: Theme.of(context).cardColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  child: TextButton(
                    clipBehavior: Clip.antiAlias,
                    style: TextButton.styleFrom(),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
