import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/src/theme/app_fonts/app_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  final String img,title,body;
  const OnBoardingScreen({super.key, required this.img, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          width: MediaQuery.of(context).size.width,
          height: 300.h,
          child: Image.asset(img),
        ),
        SizedBox(height: 52.h,),
        Text(title,style: AppStyle.h1(),),
        SizedBox(height: 42.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Text(body,style: AppStyle.body(),textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}
