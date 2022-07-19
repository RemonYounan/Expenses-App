import 'package:awesome_card/awesome_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/screens/add_credit_screen.dart';
import 'package:provider/provider.dart';

class CreditCardCarouse extends StatefulWidget {
  const CreditCardCarouse({Key? key}) : super(key: key);

  @override
  State<CreditCardCarouse> createState() => _CreditCardCarouseState();
}

class _CreditCardCarouseState extends State<CreditCardCarouse> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Provider.of<CreditCards>(context, listen: false).getCreditCards();
    final credits =
        Provider.of<CreditCards>(context, listen: false).creditCards;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: credits.length,
              itemBuilder: (context, index, realIndex) => Builder(
                builder: (context) => ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CreditCard(
                    cardNumber: credits[index]
                        .number
                        .toString()
                        .replaceRange(0, 12, '**** **** **** '),
                    cardExpiry: credits[index].expiryDate,
                    cardHolderName: credits[index].name,
                    cvv: '${credits[index].cvv}',
                    bankName: credits[index].type!,
                    cardType: credits[index].type! == 'Master Card'
                        ? CardType.masterCard
                        : CardType.visa,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.black,
                    width: screenWidth * .8,
                    height: screenHight * .27,
                  ),
                ),
              ),
              options: CarouselOptions(
                onPageChanged: (page, reason) {
                  setState(() {
                    activePage = page;
                  });
                },
                viewportFraction: .76,
                enlargeCenterPage: true,
                height: 220,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: credits.map((credit) {
                final index = credits.indexOf(credit);
                return Container(
                  width: 16,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: activePage == index
                        ? const Color.fromARGB(255, 162, 60, 210)
                        : const Color.fromARGB(255, 79, 38, 96),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
