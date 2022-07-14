import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';

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
                            .headlineMedium!
                            .copyWith(fontSize: 22),
                      ),
                    ),
                  ),
                  builder: (ctx, transactions, ch) =>
                      transactions.transactions.isEmpty
                          ? ch!
                          : SizedBox(
                              height: size.height * .4,
                              child: ListView.builder(
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
                ),
    );
  }
}
