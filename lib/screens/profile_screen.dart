import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/credit_card.dart';
import 'package:personal_expenses/widgets/credit_card_carouse.dart';
import 'package:personal_expenses/widgets/credits_info.dart';
import 'package:personal_expenses/widgets/profile_slider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Profile',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
            Align(
              heightFactor: .7,
              child: Row(
                children: [
                  const ProfileSlider(),
                  Expanded(
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        RotatedBox(
                          quarterTurns: -45,
                          child: SizedBox(
                            height: size.height * .5,
                            width: size.width,
                            child: const CreditCardCarouse(
                              showIndex: false,
                            ),
                          ),
                        ),
                        Positioned(
                            left: -10,
                            top: 20,
                            child: IconButton(
                              iconSize: 60,
                              splashRadius: 20,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CreditsInfo(),
          ],
        ),
      ),
    );
  }
}
