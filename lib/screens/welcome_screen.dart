import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/add_credit_screen.dart';
import 'package:personal_expenses/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/screenshot_1.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mediaQuery.size.height * .57,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Save your \ntime & less \nExpense',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 50,
                        color: Colors.green.shade300,
                      ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sollicitudin elementum orci sed condimentum.',
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                  // const Spacer(),
                  Container(
                    height: mediaQuery.size.height * .1,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                      color: Theme.of(context).cardColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showHome', true);
                          Navigator.pushReplacementNamed(
                              context, AddCreditScreen.routeName);
                        },
                        child: Text(
                          'Start Now',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(.8)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
