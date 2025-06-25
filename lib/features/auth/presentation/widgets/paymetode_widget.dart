import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymetodeWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final double? radius;
  final SvgPicture? picture;
  final Color? color;
  void Function()? onTap;

  PaymetodeWidget({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.picture,
    this.color,
    this.onTap,
  });

  @override
  State<PaymetodeWidget> createState() => _PaymetodeWidgetState();
}

class _PaymetodeWidgetState extends State<PaymetodeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Ink(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.95,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius ?? 25),
          color: widget.color,
          border: Border.all(color: Color(0xff5A6CEA14)),
        ),
        child: Center(child: widget.picture),
      ),
    );
  }
}
