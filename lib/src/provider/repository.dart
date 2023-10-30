import 'package:todoapp/src/database/database_helper.dart';
import 'package:todoapp/src/model/task_model.dart';

class Repository{
  final DataBaseHelper _baseHelper = DataBaseHelper();
  Future<int> saveToDo(task) => _baseHelper.saveTodo(task);
  Future<List<TaskModel>> getDatabase() => _baseHelper.getDatabase();
}