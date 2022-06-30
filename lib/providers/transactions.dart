import 'package:flutter/cupertino.dart';
import 'package:personal_expenses/helpers/db_tx_helper.dart';
import 'package:personal_expenses/models/transaction.dart';

class Transactions with ChangeNotifier {
  List<UserTransaction> _transactions = [];

  List<UserTransaction> get transactions {
    return _transactions;
  }

  void AddTransaction(String title, double amount, DateTime date) async {
    final idDateTime = DateTime.now().toString();
    _transactions.add(
      UserTransaction(
        id: idDateTime,
        title: title,
        amount: amount,
        date: date,
      ),
    );
    notifyListeners();
    try {
      await DBTxHelper.insert('UserTransactions', {
        'id': idDateTime,
        'title': title,
        'amount': amount,
        'date': date.toIso8601String(),
      });
    } catch (err) {
      print('add to db error : $err');
    }
  }

  Future<void> getTransactions() async {
    try {
      final dataList = await DBTxHelper.getData('UserTransactions');
      _transactions = dataList.map(
        (item) {
          return UserTransaction(
            id: item['id'].toString(),
            title: item['title'],
            amount: item['amount'],
            date: DateTime.parse(item['date'] as String),
          );
        },
      ).toList();
      notifyListeners();
    } catch (err) {
      print('getTransaction error: $err');
    }
  }

  void deleteTx(String id) async {
    _transactions.removeWhere((element) => element.id == id);
    await DBTxHelper.deleteTx(id);
    notifyListeners();
  }
}
