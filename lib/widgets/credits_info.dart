import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CustomPaint(
        painter: CreditPainter(context),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 10, right: 0, bottom: 20),
              child: Text(
                'Card Informations',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 22),
              ),
            ),
            FutureBuilder(
              future: Provider.of<CreditCards>(context, listen: false)
                  .getCreditCards(),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
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
                                .headlineMedium!
                                .copyWith(fontSize: 22),
                          ),
                        ),
                      ),
                      builder: (ctx, credits, ch) => credits.creditCards.isEmpty
                          ? ch!
                          : ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: credits.creditCards.length,
                              itemBuilder: (_, i) => CreditCardDetails(
                                type: credits.creditCards[i].type!,
                                name: credits.creditCards[i].name!,
                                number: credits.creditCards[i].number!,
                                pin: credits.creditCards[i].pin!,
                                expiryDate: credits.creditCards[i].expiryDate!,
                                cvv: credits.creditCards[i].cvv!,
                              ),
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
