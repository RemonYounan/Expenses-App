import 'package:flutter/cupertino.dart';
import 'package:personal_expenses/helpers/db_tx_helper.dart';
import 'package:personal_expenses/models/transaction.dart';

class Transactions with ChangeNotifier {
  List<UserTransaction> _transactions = [];

  List<UserTransaction> get transactions {
    return _transactions;
  }

  double getTotalExpenses() {
    var expenses = 0.0;
    for (final element in _transactions) {
      expenses += element.amount!;
    }
    return expenses;
  }

  double getCategoryExpense(String category) {
    var categoryExpense = 0.0;
    for (final element in _transactions) {
      if (element.category == category) {
        categoryExpense += element.amount!;
      }
    }
    return categoryExpense;
  }

  double getMaxCatExpense() {
    final max = _transactions.isEmpty
        ? 0.0
        : _transactions
            .map((e) => e.amount)
            .toList()
            .reduce((value, element) => value! > element! ? value : element);
    return max!;
  }

  Future<void> addTransaction(
    String category,
    String title,
    double amount,
    DateTime date,
  ) async {
    final idDateTime = DateTime.now().toString();
    _transactions.add(
      UserTransaction(
        id: idDateTime,
        category: category,
        title: title,
        amount: amount,
        date: date,
      ),
    );
    notifyListeners();
    try {
      await DBTxHelper.insert('UserTransactions', {
        'id': idDateTime,
        'category': category,
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
            category: item['category'].toString(),
            title: item['title'].toString(),
            amount: double.parse(item['amount'].toString()),
            date: DateTime.parse(item['date'] as String),
          );
        },
      ).toList();

      notifyListeners();
    } catch (err) {
      print('getTransaction error: $err');
    }
  }

  Future<void> deleteTx(String id) async {
    _transactions.removeWhere((element) => element.id == id);
    await DBTxHelper.deleteTx(id);
    notifyListeners();
  }

  Future<void> deleteTable() async {
    await DBTxHelper.deleteTable();
  }
}
