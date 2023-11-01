import 'package:sqflite/sqflite.dart' as dataBase;
import 'package:path/path.dart';
import 'package:todoapp/src/model/task_model.dart';

class DataBaseHelper {
  static final DataBaseHelper _dataBaseHelper =
  DataBaseHelper._init();

  factory DataBaseHelper() => _dataBaseHelper;
  static dataBase.Database? _db;

  DataBaseHelper._init();

  /// Database yartilganmi yoki yartalimaganmi?
  Future<dataBase.Database> get AsosiyDB async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDb();

    return _db!;
  }

  /// Yangi baza ochadi
  _initDb() async {
    /// Bazani yo'lni oladi
    String dataBasePath = await dataBase.getDatabasesPath();
    String path = join(dataBasePath, 'todo');
    print(dataBasePath);
    var db = dataBase.openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(dataBase.Database db, int version) async {
    await db.execute(
        'CREATE TABLE myTodo('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'title TEXT,'
        'desc TEXT,'
        'date TEXT,'
        'endTime TEXT,'
        'startTime TEXT,'
        'priority INTEGER'
        ')');
  }


  Future<int> saveTodo(TaskModel task) async {
    var dbClient = await AsosiyDB;
    var result = await dbClient.insert(
      'myTodo', task.toJson(),
    );
    print(result);
    return result;
  }

  Future<List<TaskModel>> getDatabase() async {
    var dbClient = await AsosiyDB;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM myTodo');
    List<TaskModel> data = <TaskModel>[];
    for (int i = 0; i < list.length; i++) {
      TaskModel taskModel = TaskModel(
        title: list[i]['title'],
        desc: list[i]['desc'],
        date: list[i]['date'],
        startTime: list[i]['startTime'],
        endTime: list[i]['endTime'],
        priority: list[i]['priority'],
      );
      data.add(taskModel);
    }
    return data;
  }

  Future<int> updateBase(TaskModel item)async{
    var dbClient = await AsosiyDB;
    var result = dbClient.update('myTodo', item.toJson(),
    where: 'id=?',
    whereArgs: [item.id]);
    return result;
  }
  Future<int>deleteBase(TaskModel item)async{
    var dbClient = await AsosiyDB;
    var result = dbClient.delete('myTodo',where: 'id=?',whereArgs: [item.id]);
    return result;
  }


}

