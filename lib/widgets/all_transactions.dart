import 'package:flutter/material.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';
import 'package:provider/provider.dart';

class AllTransactions extends StatelessWidget {
  AllTransactions({
    required this.viewAll,
    Key? key,
  }) : super(key: key);
  bool viewAll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: viewAll
          ? AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: const Text('All transactions'),
              elevation: 0,
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: viewAll ? const EdgeInsets.only(top: 8) : EdgeInsets.zero,
          child: Card(
            child: FutureBuilder(
              future: Provider.of<Transactions>(context, listen: false)
                  .getTransactions(),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<Transactions>(
                      child: SizedBox(
                        height: 140,
                        child: Center(
                          child: Text(
                            'There is no transactions.',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 22),
                          ),
                        ),
                      ),
                      builder: (ctx, transactions, ch) => transactions
                              .transactions.isEmpty
                          ? ch!
                          : ListView.builder(
                              clipBehavior: Clip.antiAlias,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: transactions.transactions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: TransactionItem(transactions, index),
                                );
                              },
                            ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
