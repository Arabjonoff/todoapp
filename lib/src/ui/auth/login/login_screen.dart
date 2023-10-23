import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/src/ui/main/main_screen.dart';

import '../../../theme/app_color/app_color.dart';
import '../../../theme/app_fonts/app_fonts.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return  Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('Login', style: AppStyle.h1(),),
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
          SizedBox(height: 34.h,),
          ButtonWidget(text: 'Register', onTap: () async {
            SharedPreferences pre = await SharedPreferences.getInstance();
            String user = pre.getString('username')??'';
            String password = pre.getString('password')??'';
            if(user == userController.text && password == passwordController.text){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){
                return MainScreen();
              }));
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
