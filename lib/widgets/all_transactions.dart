import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';

class AllTransactions extends StatelessWidget {
  AllTransactions(this.viewAll, {Key? key}) : super(key: key);
  bool viewAll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: viewAll
          ? AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text('All transactions'),
              elevation: 0,
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
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
                          child:
                              // IconButton(
                              //   icon: Icon(Icons.add),
                              //   onPressed: () {
                              //     Provider.of<Transactions>(context, listen: false)
                              //         .deleteTable();
                              //   },
                              // )
                              Text(
                            'There is no transactions.',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
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
                                  padding: const EdgeInsets.all(8.0),
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
