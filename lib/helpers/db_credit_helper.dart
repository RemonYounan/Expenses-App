import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBCreditHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    final path = join(dbPath, 'credit_card.db');
    return sql.openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE CreditCards(id TEXT PRIMARY KEY, type TEXT, name TEXT, number INTEGER, pin INTEGER, expiryDate TEXT, cvv INTEGER)',
        );
      },
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    try {
      final db = await DBCreditHelper.database();
      await db.transaction(
        (txn) async {
          await txn.insert(
            'CreditCards',
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
    final db = await DBCreditHelper.database();
    return db.query(table);
  }

  static Future<void> deleteTx(String id) async {
    final db = await DBCreditHelper.database();
    await db.transaction((txn) async {
      await txn.delete('CreditCards', where: 'id = ?', whereArgs: [id]);
    });
  }
}
