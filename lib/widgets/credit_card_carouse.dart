import 'package:awesome_card/awesome_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:provider/provider.dart';

class CreditCardCarouse extends StatelessWidget {
  const CreditCardCarouse({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CreditCards>(context, listen: false).getCreditCards(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<CreditCards>(
                  child: Center(
                    child: CreditCard(
                      bankName: 'BankName',
                      cardType: CardType.masterCard,
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.black,
                      width: 300,
                      height: 190,
                    ),
                  ),
                  builder: (context, value, ch) => value.creditCards.isEmpty
                      ? ch!
                      : CarouselSlider(
                          items: [
                            CreditCard(
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
                              width: 320,
                              height: 190,
                            ),
                          ],
                          options: CarouselOptions(),
                        ),
                ),
    );
  }
}
