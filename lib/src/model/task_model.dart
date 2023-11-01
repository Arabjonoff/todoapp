class TaskModel{
  int id = 0;
  String title = '';
  String desc=  ' ';
  String date = "";
  String startTime = "";
  String endTime =" ";
  int priority =0;

  TaskModel({
    required this.title,
    required this.desc,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.priority,
    this.id=0,
  });

  Map<String,dynamic> toJson()=> {
    "id":id,
    "title":title,
    "desc":desc,
    "date":date,
    "startTime":startTime,
    "endTime":endTime,
    "priority":priority
  };
}