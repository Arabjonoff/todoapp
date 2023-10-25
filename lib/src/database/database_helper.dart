import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DataBaseHelper{
  static final DataBaseHelper _dataBaseHelper =
  DataBaseHelper.internal();

  factory DataBaseHelper() => _dataBaseHelper;
  static Database? _db;

  DataBaseHelper.internal();


  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDb();

    return _db!;
  }
  _initDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'todo');
    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
  void _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE myTodo('
        'text TEXT PRIMARY KEY,'
        'id INTEGER PRIMARY KEY,'
        'description TEXT'
        ')');
  }


  Future<int> saveTodo() async {
    var dbClient = await db;
    var result = await dbClient.insert(
      'myTodo',
      {
        "text":"QALE",
        "id":"1",
        "description":"YAXSHI",

      },

    );
    print("Sql Result: $result");
    return result;
  }

  Future<List> getDatabase() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM myTodo');
    List data = [];
    for(int i =0; i < list.length;i++){
      data.add(list[i]);
    }
    print(data);
    return data;
  }


}