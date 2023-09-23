// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;
  final double blurRadius;
  final double shadowOpacity;
  final Offset shadowOffset;

  CommonContainer({
    this.onTap,
    required this.child,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.alignment,
    this.blurRadius = 4.0,
    this.shadowOpacity = 0.2,
    this.shadowOffset = const Offset(0, 2),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        alignment: alignment,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          border: border,
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(shadowOpacity),
              blurRadius: blurRadius,
              offset: shadowOffset,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
