import 'package:flutter/material.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.background,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.abc),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.abc),label: ''),
        ],
      ),
    );
  }
}
