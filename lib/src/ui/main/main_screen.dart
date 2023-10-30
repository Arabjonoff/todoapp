import 'package:flutter/material.dart';
import 'package:todoapp/src/database/database_helper.dart';
import 'package:todoapp/src/dialog/bottom_dialog/bottom_dialog.dart';
import 'package:todoapp/src/model/task_model.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';
import 'package:todoapp/src/ui/main/home/home_screen.dart';
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
      backgroundColor: AppColor.background,
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        backgroundColor: AppColor.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: ''),
          BottomNavigationBarItem(icon: Container(
            decoration: BoxDecoration(
                color: AppColor.purple,
                borderRadius: BorderRadius.circular(50)
            ),
            padding: const EdgeInsets.all(10),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){
                  BottomDialog.showAddTaskDialog(context);
                },icon: Icon(Icons.add,size: 44,color: AppColor.white,),)), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
