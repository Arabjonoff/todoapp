import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final bool obscureText;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hinText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.textFieldColor,
          border: Border.all(color: AppColor.grey)),
      height: 48.h,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
          hintText: hinText,
          hintStyle: const TextStyle(color: Colors.grey)
        ),
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }
}
