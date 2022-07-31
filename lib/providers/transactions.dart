import 'package:flutter/cupertino.dart';
import 'package:personal_expenses/helpers/db_tx_helper.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

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

  List<UserTransaction> get recentDaysTx {
    return _transactions.where((tx) {
      return tx.date!.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  List<Map<String, dynamic>> get recentDaysTxValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentDaysTx.length; i++) {
        if (recentDaysTx[i].date!.day == weekDay.day &&
            recentDaysTx[i].date!.month == weekDay.month &&
            recentDaysTx[i].date!.year == weekDay.year) {
          totalSum += recentDaysTx[i].amount!;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).toList();
  }

  double get totalDaysSpending {
    return recentDaysTxValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  List<UserTransaction> get recentWeeksTx {
    return _transactions.where((tx) {
      return tx.date!.isAfter(
        DateTime.now().subtract(
          const Duration(days: 21),
        ),
      );
    }).toList();
  }

  List<Map<String, dynamic>> get recentWeeksTxValues {
    return List.generate(3, (index) {
      final week = DateTime.now().subtract(
        Duration(days: index * 7),
      );
      String? weekname;
      var totalSum = 0.0;
      for (var i = 0; i < recentWeeksTx.length; i++) {
        if (recentWeeksTx[i].date!.isBefore(week) &&
            recentWeeksTx[i]
                .date!
                .isAfter(week.subtract(const Duration(days: 7)))) {
          totalSum += recentWeeksTx[i].amount!;
        }
      }
      if (index == 0) {
        weekname = 'This Week';
      } else if (index == 1) {
        weekname = 'Last Week';
      } else if (index == 2) {
        weekname = 'Week before';
      }
      return {
        'week': weekname,
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalWeeksSpending {
    return recentWeeksTxValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  List<Map<String, dynamic>> get recentMonthsTxValues {
    final monthsDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return List.generate(12, (index) {
      final month = DateTime.now().subtract(
        Duration(days: index * monthsDays[DateTime.now().month]),
      );
      var totalSum = 0.0;
      for (var i = 0; i < _transactions.length; i++) {
        if (_transactions[i].date!.month == month.month) {
          totalSum += _transactions[i].amount!;
        }
      }

      return {
        'month': DateFormat.MMMM().format(month),
        'amount': totalSum,
      };
    }).toList();
  }

  double get totalMonthsSpending {
    return recentMonthsTxValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
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
