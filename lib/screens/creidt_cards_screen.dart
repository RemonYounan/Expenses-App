import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/credit_cards.dart';
import 'package:personal_expenses/widgets/credit_item.dart';
import 'package:provider/provider.dart';

class CreditCardsScreen extends StatelessWidget {
  const CreditCardsScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text('Credit cards information'),
      ),
      body: SafeArea(
        child: Consumer<CreditCards>(
          builder: (context, credits, child) {
            return ListView.builder(
              itemCount: credits.creditCards.length,
              itemBuilder: (ctx, i) => Card(
                color: Theme.of(context).cardColor,
                child: CreditItem(
                  i,
                  credits,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
