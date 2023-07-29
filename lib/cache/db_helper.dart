import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  static const String _tableName = "tasks";
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    } else {
      String path = join(await getDatabasesPath() + "tasks.db");
      _db = await openDatabase(path, version: 1, onCreate: (db, version) {
        var sql = """ CREATE TABLE $_tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title STRING,
          description STRING,
          createdTime STRING,
          priority INTEGER
          startTime STRING
          dueDate STRING
          status INTEGER
        )""";
        return db.execute(sql);
      });
    }
  }
}
