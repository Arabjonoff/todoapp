import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';
import 'package:todoapp/src/theme/app_fonts/app_fonts.dart';
import 'package:todoapp/src/widget/button_widget.dart';
import 'package:todoapp/src/widget/textfield_widget.dart';

import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('Register', style: AppStyle.h1(),),
          ),
          SizedBox(height: 34.h,),
          Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text('Username', style: AppStyle.body(),),),
          TextFieldWidget(controller: userController, hinText: 'Enter Username', obscureText: false),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 16, left: 16),
            child: Text('Password', style: AppStyle.body(),),
          ),
          TextFieldWidget(controller: passwordController, hinText: 'Enter password', obscureText: false),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 16, left: 16),
            child: Text('Confirm Password', style: AppStyle.body(),),
          ),
          TextFieldWidget(controller: confirmPasswordController, hinText: 'Confirm password', obscureText: false),
          SizedBox(height: 34.h,),
          ButtonWidget(text: 'Register', onTap: () async {
            SharedPreferences pre = await SharedPreferences.getInstance();
            String user = pre.getString('username')??'';
            if(user == userController.text){
              ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text('bu user mavjud'),)));
            }else{
              pre.setString('username', userController.text);
              pre.setString('password', confirmPasswordController.text);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return LoginScreen();
              }));
            }
          }, color: AppColor.purple)
        ],
      ),
    );
  }
}
