class TaskModel{
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
  });

  Map<String,dynamic> toJson()=>
      {
    "title":title,
    "desc":desc,
    "date":date,
    "startTime":startTime,
    "endTime":endTime,
    "priority":priority
  };
}