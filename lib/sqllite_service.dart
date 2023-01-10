import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {

  late Database db;

  SqliteService() {
    initDatabase();
  }

  initDatabase() async {

    String path = join(await getDatabasesPath(), 'test.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute( 'CREATE TABLE test ('
              'id INTEGER PRIMARY KEY, '
              'name TEXT, '
              'value INTEGER, '
              'num REAL'
              ')');
        });
  }

  insert() async {
    return await db.rawInsert( 'INSERT INTO Test(name, value, num) '
        'VALUES("some name", 1234, 456.789)'
    );
  }


  close() async {
    await db.close();
  }
}