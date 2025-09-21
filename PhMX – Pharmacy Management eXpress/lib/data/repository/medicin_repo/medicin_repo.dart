import 'package:parmacy_billing_system/model/medicin/medicin_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AllMedicinRepo {
  static const _dbName = "medical_database.db";
  static const _tableMedicin = "all_medicin";

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableMedicin (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            expiryDate TEXT,
            buyingDate TEXT,
            sellingDate TEXT,
            actualRateMO REAL,
            buyingRateMO REAL,
            sellingRateMO REAL,
            actualRateS REAL,
            buyingRateS REAL,
            sellingRateS REAL,
            supplierId INTEGER
          )
        ''');
      },
      version: 1,
    );
    return database;
  }
   static insert({required AllMedicinModel note}) async {
    final db = await _database();
    await db.insert(
      _tableMedicin,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
   static Future<List<AllMedicinModel>> getAllMedicins() async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(_tableMedicin);

    return List.generate(maps.length, (i) {
      return AllMedicinModel.fromMap(maps[i]);
    });
  }
}
