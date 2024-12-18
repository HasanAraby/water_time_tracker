import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:water_time_tracker/model/record_model.dart';

class DbHelper {
  // static final DbHelper _instance = DbHelper().internal;
  // factory DbHelper() => _instance;
  // DbHelper.internal();
  // DbHelper get internal => _instance;

  DbHelper._();
  static final DbHelper _x = DbHelper._();
  factory DbHelper() {
    return _x;
  }

  static Database? _db;

  Future<Database> createDatabase() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), 'app.db');

    _db = await openDatabase(
      path,
      version: 3,
      onCreate: (Database db, int v) async {
        await db.execute('''CREATE TABLE records(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date VARCHAR,
    amount INT,
    time VARCHAR
    )''');
      },
    );
    return _db!;
  }

  Future<List>? readRecords() async {
    Database db = await createDatabase();
    List list = await db.query('records');

    return list;
  }

  Future<int>? insertRecord(RecordModel record) async {
    Database db = await createDatabase();
    return await db.insert('records', record.toJson());
  }

  Future<int>? deleteRecord(int id) async {
    Database db = await createDatabase();
    return await db.delete('records', where: 'id = ?', whereArgs: [id]);
  }

  Future<int>? updateRecord(RecordModel record) async {
    Database db = await createDatabase();
    return await db.update('records', record.toJson(),
        where: 'id = ?', whereArgs: [record.id]);
  }

  //delet all raws
  deleteAll() async {
    print('delted all raws');
    Database db = await createDatabase();
    return await db.rawDelete("DELETE FROM records");
  }

  //insert all raws
  insertAll(List list) async {
    Database db = await createDatabase();

    for (Map<String, dynamic> record in list) {
      await db.insert('records', record);
    }
  }
}
