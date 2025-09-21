
import 'package:parmacy_billing_system/model/revenue/revenue_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RevenueRepo {
  static const _dbName = "medical_database.db";
  static const _tableRevenue = "revenue_table";

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableRevenue (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            billingId INTEGER,
            totalAmount REAL,
            balance REAL,
            profit REAL
          )
        ''');
      },
      version: 1,
    );
    return database;
  }
  static insert({required RevenueModel note}) async {
    final db = await _database();
    await db.insert(
      _tableRevenue,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
   static Future<List<RevenueModel>> getAllRevenue() async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(_tableRevenue);

    return List.generate(maps.length, (i) {
      return RevenueModel.fromMap(maps[i]);
    });
  }
}
