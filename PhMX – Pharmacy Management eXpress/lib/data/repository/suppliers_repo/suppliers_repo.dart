import 'package:parmacy_billing_system/model/suppliers/suppliers_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class SuppliersRepo {
  static const _dbName = "medical_database.db";
  static const _tableSuppliers = "suppliers_table";

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableSuppliers (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fullName TEXT,
            details TEXT
          )
        ''');
      },
      version: 1,
    );
    return database;
  }
   static insert({required SuppliersModel note}) async {
    final db = await _database();
    await db.insert(
      _tableSuppliers,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
   static Future<List<SuppliersModel>> getAllSuppliers() async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(_tableSuppliers);

    return List.generate(maps.length, (i) {
      return SuppliersModel.fromMap(maps[i]);
    });
  }
}
