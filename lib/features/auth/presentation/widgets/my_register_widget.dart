import 'package:flutter/material.dart';

class MyRegisterWidget extends StatefulWidget {
  final double? radius;
  final double? width;
  final double? height;
  final String title;
  void Function()? onTap;
  final Color? titleColor;
  final Color? color;
  final double? fontSize;
  
  
   MyRegisterWidget({super.key, this.width, this.height, this.radius, required this.title, this.titleColor, this.color, this.fontSize});

  @override
  State<MyRegisterWidget> createState() => _MyRegisterWidgetState();
}

class _MyRegisterWidgetState extends State<MyRegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 300,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius ?? 20),
        color: widget.color ?? Colors.white,
      ),
      child: Center(child: Text(widget.title),),
    );
  }
}