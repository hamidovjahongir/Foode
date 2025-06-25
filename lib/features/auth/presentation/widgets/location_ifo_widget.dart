import 'package:flutter/material.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/app_images.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';

class LocationIfoWidget extends StatefulWidget {
  final double? radius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? colorText;
  final String? title1;
  final String? title2;
  final Icon icon;
  final Icon icon2;
  final void Function()? onTap;
  LocationIfoWidget({
    super.key,
    this.radius,
    this.width,
    this.height,
    this.color,
    this.colorText,

    this.onTap,
    required this.icon,
    required this.icon2,
    this.title1,
    this.title2,
  });

  @override
  State<LocationIfoWidget> createState() => _LocationIfoWidgetState();
}

class _LocationIfoWidgetState extends State<LocationIfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.95,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius ?? 2),
        color: Colors.white,
        border: Border.all(color: AppColors.red),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.red.withOpacity(0.1),
            ),

            child: widget.icon,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.title1}'),
              Text(
                '${widget.title1}',
                style: AppTextStyles.s18w600.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutralBlack,
                ),
              ),
            ],
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.red,
            ),
            child: widget.icon2,
          ),
        ],
      ),
    );
  }
}
