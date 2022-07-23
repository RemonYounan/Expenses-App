import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/widgets/credit_card.dart';
import 'package:provider/provider.dart';

class CreditCardCarouse extends StatefulWidget {
  const CreditCardCarouse({required this.showIndex, Key? key})
      : super(key: key);
  final bool showIndex;
  @override
  State<CreditCardCarouse> createState() => _CreditCardCarouseState();
}

class _CreditCardCarouseState extends State<CreditCardCarouse> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future:
            Provider.of<CreditCards>(context, listen: false).getCreditCards(),
        builder: (_, snapshot) {
          final credits =
              Provider.of<CreditCards>(context, listen: false).creditCards;
          return Center(
            child: credits.isEmpty
                ? SizedBox(
                    height: screenHight * .2,
                    width: screenWidth * .6,
                    child: const CreditCard(
                      creditType: 'Master Card',
                      creditNumbers: '****XXXX',
                    ),
                  )
                : Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: credits.length,
                        itemBuilder: (context, index, realIndex) => CreditCard(
                          creditType: credits[index].type!,
                          creditNumbers: credits[index]
                              .number!
                              .toString()
                              .replaceRange(0, 12, '****'),
                        ),
                        options: CarouselOptions(
                          aspectRatio: 19 / 6,
                          onPageChanged: (page, reason) {
                            setState(() {
                              activePage = page;
                            });
                          },
                          viewportFraction: .7,
                          enlargeCenterPage: true,
                        ),
                      ),
                      if (widget.showIndex)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: credits.map(
                            (credit) {
                              final index = credits.indexOf(credit);
                              return Container(
                                width: 14,
                                height: 8,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  color: activePage == index
                                      ? const Color.fromARGB(255, 162, 60, 210)
                                      : const Color.fromARGB(255, 79, 38, 96),
                                ),
                              );
                            },
                          ).toList(),
                        )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
