import 'package:parmacy_billing_system/model/billing/billing_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BillingRepo {
  static const _dbBilling = "billing_Database.db";
  static const _tableBilling = "billing_table";

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbBilling),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableBilling (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userID INTEGER,
            medicinID INTEGER,
            noOfMedicin INTEGER,
            dateofBuy TEXT,
            totalAmountbill REAL,
            balance REAL
          )
        ''');
      },
      version: 1,
    );
    return database;
  }

  static insert({required BillingModel note}) async {
    final db = await _database();
    await db.insert(
      _tableBilling,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<BillingModel>> getBillings() async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(_tableBilling);

    return List.generate(maps.length, (i) {
      return BillingModel.fromMap(maps[i]);
    });
  }
}
