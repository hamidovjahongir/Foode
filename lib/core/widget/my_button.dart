import 'package:flutter/material.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  final double? radius;
  final double? width;
  final double? height;
  final String title;
  void Function()? onTap;
  final Color? titleColor;
  final Color? color;
  final double? fontSize;

  MyButton({
    super.key,
    this.radius,
    this.width,
    this.height,
    required this.title,
    this.onTap,
    this.titleColor,
    this.color,
    this.fontSize,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
        height: widget.height ?? 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius ?? 35),
          color: widget.color ?? Colors.blue,
        ),
        child: Center(
          child: Text(
            widget.title,
            style: GoogleFonts.sourceSans3(
              color: widget.titleColor ?? AppColors.red,
              fontWeight: FontWeight.bold,
              fontSize: widget.fontSize ?? 18,
            ),
          ),
        ),
      ),
    );
  }
}
