import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';
import 'package:provider/provider.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      future:
          Provider.of<Transactions>(context, listen: false).getTransactions(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<Transactions>(
                  child: SizedBox(
                    height: size.height * .15,
                    child: Center(
                      child: Text(
                        'There is no transactions.',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  builder: (ctx, transactions, ch) =>
                      transactions.transactions.isEmpty
                          ? ch!
                          : ListView.builder(
                              clipBehavior: Clip.antiAlias,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: transactions.transactions.length >= 5
                                  ? 5
                                  : transactions.transactions.length,
                              itemBuilder: (context, index) {
                                return TransactionItem(transactions, index);
                              },
                            ),
                ),
    );
  }
}
