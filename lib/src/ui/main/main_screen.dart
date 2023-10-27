import 'package:flutter/material.dart';
import 'package:todoapp/src/database/database_helper.dart';
import 'package:todoapp/src/model/task_model.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';
import 'package:todoapp/src/widget/button_widget.dart';
import 'package:todoapp/src/widget/textfield_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerStartTime = TextEditingController();
  TextEditingController controllerEndTime = TextEditingController();
  TextEditingController priority = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(controller: controllerTitle,
                hinText: 'text',
                obscureText: false),
            TextFieldWidget(controller: controllerDesc,
                hinText: 'desc',
                obscureText: false),
            TextFieldWidget(controller: controllerDate,
                hinText: 'date',
                obscureText: false),
            TextFieldWidget(controller: controllerStartTime,
                hinText: 'start time',
                obscureText: false),
            TextFieldWidget(controller: controllerEndTime,
                hinText: 'end time',
                obscureText: false),
            TextFieldWidget(
                controller: priority, hinText: 'priority', obscureText: false),
            SizedBox(height: 32,),
            ButtonWidget(text: "text", onTap: () {
              TaskModel task = TaskModel(
                  title: controllerTitle.text,
                  desc: controllerDesc.text,
                  date: controllerDate.text,
                  startTime: controllerStartTime.text,
                  endTime: controllerEndTime.text,
                  priority: int.parse(priority.text));
              dataBaseHelper.saveTodo(task);
            }, color: AppColor.purple)
          ]
      ),
      backgroundColor: AppColor.background,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.background,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
        ],
      ),
    );
  }
}
