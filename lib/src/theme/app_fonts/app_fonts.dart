
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';

class AppStyle{
  static TextStyle h1(){
    return TextStyle(
      fontSize: 32.h,
      color: AppColor.white,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle h2(){
    return TextStyle(
      fontSize: 24.h,
      color: AppColor.white,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle h3(){
    return TextStyle(
      fontSize: 20.h,
      color: AppColor.white,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle body(){
    return TextStyle(
      fontSize: 16.h,
      color: AppColor.white,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle small(Color color){
    return TextStyle(
      fontSize: 13.h,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }
}