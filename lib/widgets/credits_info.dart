import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/widgets/credit_item.dart';
import 'package:provider/provider.dart';

class CreditsInfo extends StatefulWidget {
  CreditsInfo({Key? key}) : super(key: key);

  @override
  State<CreditsInfo> createState() => _CreditsInfoState();
}

class _CreditsInfoState extends State<CreditsInfo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Credit cards information',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
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
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: credits.creditCards.length,
                            itemBuilder: (_, i) =>
                                CreditItem(credits.creditCards[i], i),
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}
