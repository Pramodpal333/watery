import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:watery/models/drinks_model.dart';

class DbHelper {
// create table
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE drinks(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  qty INTEGER,
  date TEXT,
  time TEXT,
  type TEXT,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
  """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('watery.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> createDrink(DrinksModel drink) async {
    final db = await DbHelper.db();

    final data = {
      'qty': drink.qty,
      'date': drink.date.toString(),
      'time': drink.time,
      'type': drink.type,
    };
    final id = await db.insert('drinks', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getDrinks() async {
    var db = await DbHelper.db();
    return db.query("drinks", orderBy: "id");
  }

  static Future<void> deleteDrink(int id) async {
    var db = await DbHelper.db();
    try {
      await db.delete('drinks', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print("error while delete $e");
    }
  }

  static Future<void> updateDrink(DrinksModel drink) async {
    final db = await DbHelper.db();

    final data = {
      'qty': drink.qty,
      'date': drink.date.toString(),
      'time': drink.time,
      'type': drink.type,
    };

    try {
      await db.update(
        'drinks',
        data,
        where: "id = ?",
        whereArgs: [drink.id], // Assuming the drink object has an 'id' property
      );
    } catch (e) {
      print("Error while updating drink: $e");
    }
  }

}
