// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double minWidth;
  final double height;
  final double borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;

  CommonElevatedButton({
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.minWidth = double.infinity,
    this.height = 50.0,
    this.borderRadius = 8.0,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(minWidth, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    );
  }
}
