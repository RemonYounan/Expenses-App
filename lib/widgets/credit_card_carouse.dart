import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:awesome_card/awesome_card.dart';

class CreditCardCarouse extends StatelessWidget {
  const CreditCardCarouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return CarouselSlider(
      items: [
        Builder(
          builder: (ctx) {
            return InkWell(
              child: CreditCard(
                cardNumber: "5450 7879 4864 7854",
                cardExpiry: "10/25",
                cardHolderName: "Card Holder",
                cvv: "456",
                bankName: "Axis Bank",
                cardType: CardType.masterCard,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.black,
                // width: mediaQuery.size.width * .9,
                // height: mediaQuery.size.width * .55,
              ),
            );
          },
        ),
      ],
      options: CarouselOptions(
        // viewportFraction: .76,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        clipBehavior: Clip.antiAlias,
        enlargeCenterPage: true,
      ),
    );
  }
}
