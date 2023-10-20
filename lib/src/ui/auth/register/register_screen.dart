import 'package:flutter/material.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';
import 'package:todoapp/src/widget/textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(controller: TextEditingController(), hinText: 'hinText', obscureText: false)
        ],
      ),
    );
  }
}
