import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';

class MyContanerWidget extends StatefulWidget {
  final double? radius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? colorText;
  final SvgPicture? picture;
  final String? title;
  final void Function()? onTap;
  MyContanerWidget({
    super.key,
    this.radius,
    this.width,
    this.height,
    this.color,
    this.picture,
    this.title,
    this.colorText,
    this.onTap,
  });

  @override
  State<MyContanerWidget> createState() => _MyContanerWidgetState();
}

class _MyContanerWidgetState extends State<MyContanerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(widget.radius ?? 30),
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap;
        }
      },
      child: Ink(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.4,
        height: widget.height ?? 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius ?? 30),
          color: widget.color ?? Colors.white,
          border: Border.all(color: Color(0xffF4F6F9)),
        ),
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.picture ?? Icon(Icons.add),
            Text(
              widget.title ?? '',
              style: AppTextStyles.s16w600.copyWith(
                fontWeight: FontWeight.bold,
                color: widget.colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
