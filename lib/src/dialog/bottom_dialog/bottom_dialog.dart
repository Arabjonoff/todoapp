import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/src/bloc/data_base.dart';
import 'package:todoapp/src/model/task_model.dart';
import 'package:todoapp/src/provider/repository.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';
import 'package:todoapp/src/theme/app_fonts/app_fonts.dart';
import 'package:todoapp/src/widget/button_widget.dart';
import 'package:todoapp/src/widget/textfield_widget.dart';

class BottomDialog {
  static void showAddTaskDialog(BuildContext context) {
    Repository repository = Repository();
    TextEditingController controllerTask = TextEditingController();
    TextEditingController controllerDec = TextEditingController();
    TextEditingController controllerStartTime = TextEditingController();
    TextEditingController controllerEndTime = TextEditingController();
    TextEditingController controllerPriority = TextEditingController();
    showModalBottomSheet(
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          DateTime selectedDate = DateTime.now();
          return StatefulBuilder(builder: (context,setState){
            TextEditingController controllerDate = TextEditingController(text: DateFormat("yyyy-MM-dd").format(selectedDate));
            return Container(
                color: AppColor.card,
                width: MediaQuery.of(context).size.width,
                height: 408.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16.0, bottom: 8, top: 8),
                      child: Text(
                        "Add Task",
                        style: AppStyle.h3(),
                      ),
                    ),
                    TextFieldWidget(
                        controller: controllerTask,
                        hinText: "Enter Task",
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFieldWidget(
                        controller: controllerDec,
                        hinText: "Description",
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: ()async{
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                        );
                        if (picked != null && picked != selectedDate) {
                          selectedDate = picked;
                          print(picked);
                          setState((){
                          });
                        }
                      },
                      child: TextFieldWidget(
                          enable: false,
                          controller: controllerDate,
                          hinText: "Date",
                          obscureText: false),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFieldWidget(
                                controller: controllerStartTime,
                                hinText: "Start time",
                                obscureText: false)),
                        Expanded(
                            child: TextFieldWidget(
                                controller: controllerEndTime,
                                hinText: "End time",
                                obscureText: false)),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFieldWidget(
                        controller: controllerPriority,
                        hinText: "Priority",
                        obscureText: false),
                    SizedBox(
                      height: 24.h,
                    ),
                    ButtonWidget(
                        text: "Save task",
                        onTap: () {
                          TaskModel task = TaskModel(
                            title: controllerTask.text,
                            desc: controllerDec.text,
                            date: selectedDate.toString(),
                            startTime: controllerStartTime.text,
                            endTime: controllerEndTime.text,
                            priority: int.parse(controllerPriority.text),
                          );
                          repository.saveToDo(task);
                          dataBaseBloc.getBaseAllTask();
                          Navigator.pop(context);
                        },
                        color: AppColor.purple)
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: Row(
                    //     children: [
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.timer,color: AppColor.white,)),
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.local_offer_outlined,color: AppColor.white,)),
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.flag,color: AppColor.white,)),
                    //       const Spacer(),
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.send,color: AppColor.purple,)),
                    //     ],
                    //   ),
                    // )
                  ],
                ));
          });
        });
  }
  static void showUpdateTaskDialog(BuildContext context,TaskModel data) {
    Repository repository = Repository();
    TextEditingController controllerTask = TextEditingController(text: data.title);
    TextEditingController controllerDec = TextEditingController(text: data.desc);
    TextEditingController controllerStartTime = TextEditingController(text: data.startTime);
    TextEditingController controllerEndTime = TextEditingController(text: data.endTime);
    TextEditingController controllerPriority = TextEditingController(text: data.priority.toString());
    showModalBottomSheet(
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          DateTime selectedDate = DateTime.now();
          return StatefulBuilder(builder: (context,setState){
            TextEditingController controllerDate = TextEditingController(text: DateFormat("yyyy-MM-dd").format(selectedDate));
            return Container(
                color: AppColor.card,
                width: MediaQuery.of(context).size.width,
                height: 408.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16.0, bottom: 8, top: 8),
                      child: Text(
                        "Update Task",
                        style: AppStyle.h3(),
                      ),
                    ),
                    TextFieldWidget(
                        controller: controllerTask,
                        hinText: "Enter Task",
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFieldWidget(
                        controller: controllerDec,
                        hinText: "Description",
                        obscureText: false),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: ()async{
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        );
                        if (picked != null && picked != selectedDate) {
                          selectedDate = picked;
                          print(picked);
                          setState((){
                          });
                        }
                      },
                      child: TextFieldWidget(
                          enable: false,
                          controller: controllerDate,
                          hinText: "Date",
                          obscureText: false),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFieldWidget(
                                controller: controllerStartTime,
                                hinText: "Start time",
                                obscureText: false)),
                        Expanded(
                            child: TextFieldWidget(
                                controller: controllerEndTime,
                                hinText: "End time",
                                obscureText: false)),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFieldWidget(
                        controller: controllerPriority,
                        hinText: "Priority",
                        obscureText: false),
                    SizedBox(
                      height: 24.h,
                    ),
                    ButtonWidget(
                        text: "Save task",
                        onTap: () {
                          TaskModel task = TaskModel(
                            title: controllerTask.text,
                            desc: controllerDec.text,
                            date: selectedDate.toString(),
                            startTime: controllerStartTime.text,
                            endTime: controllerEndTime.text,
                            priority: int.parse(controllerPriority.text),
                          );
                          repository.updateBase(task);
                          dataBaseBloc.getBaseAllTask();
                          Navigator.pop(context);
                        },
                        color: AppColor.purple)
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: Row(
                    //     children: [
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.timer,color: AppColor.white,)),
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.local_offer_outlined,color: AppColor.white,)),
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.flag,color: AppColor.white,)),
                    //       const Spacer(),
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.send,color: AppColor.purple,)),
                    //     ],
                    //   ),
                    // )
                  ],
                ));
          });
        });
  }

}
