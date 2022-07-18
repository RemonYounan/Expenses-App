import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/add_credit_screen.dart';
import 'package:personal_expenses/widgets/credits_info.dart';
import 'package:personal_expenses/widgets/profile_slider_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
            Row(
              children: [
                const ProfileSlider(),
                IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AddCreditScreen.routeName),
                  icon: const Icon(
                    Icons.credit_card,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 44,
                ),
              ],
            ),
            const CreditsInfo(),
          ],
        ),
      ),
    );
  }
}
