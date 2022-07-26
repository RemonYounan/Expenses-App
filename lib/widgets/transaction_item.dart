import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/others/transaction_icon.dart';
import 'package:personal_expenses/providers/transactions.dart';

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
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      leading:
          TransactionIcon.getIcon(transactions.transactions[index].category!),
      title: Text(
        '${transactions.transactions[index].title}',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 18,
            ),
      ),
      subtitle: Text(
        DateFormat.yMEd().format(transactions.transactions[index].date!),
        // '${DateTime.now().difference(transactions.transactions[index].date!).inHours} hours ago',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.grey.withAlpha(180),
            ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '\$${transactions.transactions[index].amount!.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.lightGreen,
                  fontSize: 18,
                ),
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 25,
            ),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                onTap: () =>
                    transactions.deleteTx(transactions.transactions[index].id!),
                padding: const EdgeInsets.all(6),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
