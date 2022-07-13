import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

class DBTxHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    var path = join(dbPath, 'transactions.db');
    return sql.openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE UserTransactions(id TEXT PRIMARY KEY, category TEXT, title TEXT, amount REAL, date TEXT, expenses REAL)');
      },
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    try {
      final db = await DBTxHelper.database();
      await db.transaction(
        (txn) async {
          await txn.insert(
            'UserTransactions',
            data,
            conflictAlgorithm: sql.ConflictAlgorithm.replace,
          );
        },
      );
    } catch (err) {
      print('insert function: $err');
    }
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBTxHelper.database();
    return db.query(table);
  }

  static Future<void> deleteTx(String id) async {
    final db = await DBTxHelper.database();
    await db.transaction((txn) async {
      await txn.delete('UserTransactions', where: 'id = ?', whereArgs: [id]);
    });
  }

  static Future<void> deleteTable() async {
    final db = await DBTxHelper.database();
    await db.execute("DROP TABLE IF EXISTS UserTransactions");
    print('table deleted');
  }
}
