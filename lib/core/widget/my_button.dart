import 'package:flutter/material.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';

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
      borderRadius: BorderRadius.circular(widget.radius ?? 30),
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Ink(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
        height: widget.height ?? 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius ?? 35),
          // color: widget.color ?? Colors.blue,
          gradient: LinearGradient(
            colors: [Color(0xffFF7E95), Color(0xffFF1843)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: AppTextStyles.s18w600.copyWith(
              color: widget.titleColor ?? Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
