import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  builder: (ctx, transactions, ch) =>
                      transactions.transactions.isEmpty
                          ? ch!
                          : SizedBox(
                              height: 510,
                              child: ListView.builder(
                                clipBehavior: Clip.antiAlias,
                                shrinkWrap: true,
                                primary: false,
                                itemCount: transactions.transactions.length >= 7
                                    ? 7
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
