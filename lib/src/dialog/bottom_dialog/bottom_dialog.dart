import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';
import 'package:todoapp/src/theme/app_fonts/app_fonts.dart';
import 'package:todoapp/src/widget/textfield_widget.dart';

class BottomDialog{
  static void showAddTaskDialog(BuildContext context){
    showModalBottomSheet(
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
        context: context, builder: (ctx){
     return Container(
       color: AppColor.card,
       width: MediaQuery.of(context).size.width,
       height: 408.h,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.only(left: 16.0,bottom: 8,top: 8),
             child: Text("Add Task",style: AppStyle.h3(),),
           ),
           TextFieldWidget(controller: TextEditingController(), hinText: "Enter Task", obscureText: false),
           SizedBox(height: 8.h,),
           TextFieldWidget(controller: TextEditingController(), hinText: "Description", obscureText: false),
           SizedBox(height: 8.h,),
           TextFieldWidget(controller: TextEditingController(), hinText: "Date", obscureText: false),
           SizedBox(height: 8.h,),
           Row(
             children: [
               Expanded(child: TextFieldWidget(controller: TextEditingController(), hinText: "Start time", obscureText: false)),
               Expanded(child: TextFieldWidget(controller: TextEditingController(), hinText: "End time", obscureText: false)),
             ],
           )
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
       )
     );
    });
  }
}