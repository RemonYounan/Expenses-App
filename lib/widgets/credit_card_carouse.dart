import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreditCardCarouse extends StatelessWidget {
  const CreditCardCarouse({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);
    return FutureBuilder(
      future: Provider.of<CreditCards>(context).getCreditCards(),
      builder: (context, snapshot) => Consumer<CreditCards>(
        child: SizedBox(
          height: 150,
          width: 150,
          child: Center(
            child: Text(
              'add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
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
