import 'package:flutter/material.dart';
import 'package:todoapp/src/theme/app_fonts/app_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color color;
  const ButtonWidget({super.key, required this.text, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 48.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Text(text, style: AppStyle.body(),),
      ),
    );
  }
}

