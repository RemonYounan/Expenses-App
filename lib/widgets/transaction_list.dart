import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/transactions.dart';

class TransacrionList extends StatelessWidget {
  const TransacrionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMenu(
      BuildContext context,
      Transactions transactions,
      int index,
    ) async {
      int? selected = await showMenu(
        context: context,
        position: RelativeRect.fill,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Theme.of(context).primaryColor,
        items: [
          PopupMenuItem(
            value: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                  size: 30,
                ),
                Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              ],
            ),
            padding: const EdgeInsets.all(6),
          ),
        ],
      );
      if (selected == 0) {
        return;
      } else if (selected == 1) {
        transactions.deleteTx(transactions.transactions[index].id!);
      }
    }

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
                          height: 280,
                          child: ListView.builder(
                            clipBehavior: Clip.antiAlias,
                            itemCount: transactions.transactions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // tileColor: Colors.deepPurpleAccent,
                                leading: const CircleAvatar(
                                  child: Icon(Icons.attach_money_rounded,
                                      color: Colors.amber, size: 30),
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
                                trailing: Text(
                                  '\$${transactions.transactions[index].amount!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      color: Colors.amber, fontSize: 20),
                                ),
                                onLongPress: () =>
                                    _showMenu(context, transactions, index),
                              );
                            },
                          ),
                        ),
            ),
    );
  }
}
