import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../providers/transactions.dart' as txn;

final String tableTransactions = 'transactions';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnValue = 'value';

class DatabaseHelper {
 DatabaseHelper._privateConstructor();

 static final _databaseName = "transactionsDB.db";

 static final _databaseVersion = 1;

static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

static Database _database;

 Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

   _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

 Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableTransactions (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT NOT NULL,
            $columnValue REAL NOT NULL,
            
          )
          ''');
  }

  Future<int> insert(txn.Transaction element) async {
    Database db = await database;
    int id = await db.insert(tableTransactions, element.toMap());
    return id;
  }
  Future<txn.Transaction> getTransactionById(int id) async {
    Database db = await database;
    List<Map> res = await db.query(tableTransactions,
        columns: [columnId, columnTitle, columnValue],
        where: '$columnId = ?',
        whereArgs: [id]);

    if (res.isNotEmpty) {
      return txn.Transaction.fromMap(res.first);
    }
    return null;
  }
   Future<List<txn.Transaction>> getAllTransactions() async {
    Database db = await database;
    List<Map> res = await db.query(tableTransactions,
        columns: [columnId, columnTitle, columnValue]);

    List<txn.Transaction> list =
        res.map((e) => txn.Transaction.fromMap(e)).toList();

    return list;
  }
  Future<int> deleteTransactionById(int id) async {
    Database db = await database;
    int res =
        await db.delete(tableTransactions, where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllTransactions() async {
    Database db = await database;
    int res = await db.delete(tableTransactions, where: '1');
    return res;
  }


}