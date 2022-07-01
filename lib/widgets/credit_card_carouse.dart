import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:provider/provider.dart';

class CreditCardCarouse extends StatelessWidget {
  const CreditCardCarouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return CarouselSlider(
      items: [
        Builder(
          builder: (ctx) {
            return FutureBuilder(
              future: Provider.of<CreditCards>(context).getCreditCards(),
              builder: (context, snapshot) => Consumer<CreditCards>(
                child: Center(child: Text('no credits added yet')),
                builder: (context, value, ch) => value.creditCards.isEmpty
                    ? ch!
                    : CreditCard(
                        cardNumber: value.creditCards[0].number
                            .toString()
                            .replaceRange(0, 12, '**** **** **** '),
                        cardExpiry: value.creditCards[0].expiryDate,
                        cardHolderName: value.creditCards[0].name,
                        cvv: '${value.creditCards[0].cvv}',
                        bankName: value.creditCards[0].type!,
                        cardType: CardType.masterCard,
                        frontBackground: CardBackgrounds.black,
                        backBackground: CardBackgrounds.black,
                        // width: mediaQuery.size.width * .9,
                        // height: mediaQuery.size.width * .55,
                      ),
              ),
            );
          },
        ),
      ],
      options: CarouselOptions(
        // viewportFraction: .76,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        clipBehavior: Clip.antiAlias,
        enlargeCenterPage: true,
        // autoPlay: true,
        // padEnds: false,
      ),
    );
  }
}
