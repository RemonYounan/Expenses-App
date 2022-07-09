import 'package:flutter/material.dart';
import 'package:personal_expenses/others/transaction_icon.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/transactions.dart';

class TransacrionList extends StatelessWidget {
  const TransacrionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<Transactions>(context, listen: false).getTransactions(),
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
                  : SizedBox(
                      height: 280,
                      child: ListView.builder(
                        clipBehavior: Clip.antiAlias,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: transactions.transactions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // tileColor: Colors.deepPurpleAccent,
                            leading: CircleAvatar(
                              child: Icon(
                                  TransactionIcon.getIcon(transactions
                                      .transactions[index].category!),
                                  color: Colors.amber,
                                  size: 30),
                              // backgroundColor: Colors.white,
                              radius: 30,
                            ),
                            title: Text(
                              '${transactions.transactions[index].title}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            subtitle: Text(
                              DateFormat.yMEd().format(
                                  transactions.transactions[index].date!),
                              style: const TextStyle(color: Colors.grey),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$${transactions.transactions[index].amount!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      color: Colors.amber, fontSize: 20),
                                ),
                                PopupMenuButton(
                                  icon: Icon(
                                    Icons.more_vert_rounded,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      onTap: () =>
                                          print('edit pressed from onTap'),
                                      value: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                          Expanded(child: Text('Edit')),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 1,
                                      onTap: () => Provider.of<Transactions>(
                                              context,
                                              listen: false)
                                          .deleteTx(transactions
                                              .transactions[index].id!),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            color: Theme.of(context).errorColor,
                                            size: 30,
                                          ),
                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .errorColor),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(6),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
    );
  }
}
