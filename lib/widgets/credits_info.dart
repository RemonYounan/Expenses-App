import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/screens/creidt_cards_screen.dart';
import 'package:personal_expenses/widgets/credit_card_details.dart';
import 'package:personal_expenses/widgets/credit_painter.dart';
import 'package:provider/provider.dart';

class CreditsInfo extends StatefulWidget {
  const CreditsInfo({Key? key}) : super(key: key);

  @override
  State<CreditsInfo> createState() => _CreditsInfoState();
}

class _CreditsInfoState extends State<CreditsInfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          CustomPaint(
            painter: CreditPainter(context),
            size: Size(size.width, size.height * .5),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  bottom: 20,
                ),
                child: Text(
                  'Card Informations',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              FutureBuilder(
                future: Provider.of<CreditCards>(context, listen: false)
                    .getCreditCards(),
                builder: (ctx, snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Consumer<CreditCards>(
                            child: SizedBox(
                              height: 140,
                              child: Center(
                                child: Text(
                                  'There is no credit cards.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 22),
                                ),
                              ),
                            ),
                            builder: (ctx, credits, ch) =>
                                credits.creditCards.isEmpty
                                    ? ch!
                                    : CreditCardDetails(
                                        type: credits.creditCards[0].type!,
                                        name: credits.creditCards[0].name!,
                                        number: credits.creditCards[0].number!,
                                        pin: credits.creditCards[0].pin!,
                                        expiryDate:
                                            credits.creditCards[0].expiryDate!,
                                        cvv: credits.creditCards[0].cvv!,
                                      ),
                          ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: size.width * .45,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreditCardsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.expand_more_rounded),
              color: Colors.white,
              iconSize: 40,
              splashRadius: .1,
            ),
          )
        ],
      ),
    );
  }
}
