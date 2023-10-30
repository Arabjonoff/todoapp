import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/src/bloc/data_base.dart';
import 'package:todoapp/src/model/task_model.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';
import 'package:todoapp/src/theme/app_fonts/app_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    dataBaseBloc.getBaseAllTask();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: Text("Asosiy",style: AppStyle.body(),),
      ),
      backgroundColor: AppColor.background,
      body: StreamBuilder<List<TaskModel>>(
        stream: dataBaseBloc.getBaseStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data!;
            return data.isEmpty?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset("assets/image/empty.png")),
                    Text("What do you want to do today?",style: AppStyle.h3(),),
                    Text("Tap + to add your tasks",style: AppStyle.body(),),
                  ],
                )
                : ListView.builder(
              itemCount: data.length,
                itemBuilder: (ctx,index){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8),
                width: MediaQuery.of(context).size.width,
                height: 72.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.card
                ),
                child: Row(
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColor.white)
                      ),
                    ),
                    SizedBox(width: 16.w,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[index].title,style: AppStyle.body(),),
                          Row(
                            children: [
                              Text(data[index].date,style: AppStyle.small(AppColor.grey),),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: AppColor.purple)
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.flag,color: AppColor.purple,),
                                    Text(data[index].priority.toString(),style: AppStyle.body(),)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
          }
          return  Container();
        }
      )
    );
  }
}
