import 'package:rxdart/rxdart.dart';
import 'package:todoapp/src/model/task_model.dart';
import 'package:todoapp/src/provider/repository.dart';

class DataBaseBloc{
  final Repository _repository = Repository();
  final _fetchBaseInfo = PublishSubject<List<TaskModel>>();
  Stream<List<TaskModel>> get getBaseStream => _fetchBaseInfo.stream;


  getBaseAllTask()async{
    List<TaskModel> data = await _repository.getDatabase();
    _fetchBaseInfo.sink.add(data);
  }
}

final dataBaseBloc = DataBaseBloc();