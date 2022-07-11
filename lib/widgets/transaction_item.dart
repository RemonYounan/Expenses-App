import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/others/transaction_icon.dart';
import 'package:personal_expenses/providers/transactions.dart';
import 'package:provider/provider.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem(
    this.transactions,
    this.index, {
    Key? key,
  }) : super(key: key);
  Transactions transactions;
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      leading: CircleAvatar(
        child: Icon(
            TransactionIcon.getIcon(transactions.transactions[index].category!),
            color: Colors.amber,
            size: 30),
        // backgroundColor: Colors.white,
        radius: 30,
      ),
      title: Text(
        '${transactions.transactions[index].title}',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      subtitle: Text(
        DateFormat.yMEd().format(transactions.transactions[index].date!),
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '\$${transactions.transactions[index].amount!.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.amber, fontSize: 20),
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () => print('edit pressed from onTap'),
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
                onTap: () =>
                    transactions.deleteTx(transactions.transactions[index].id!),
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
          ),
        ],
      ),
    );
  }
}
