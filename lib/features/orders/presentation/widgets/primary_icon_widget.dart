import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';

class PrimaryIconWidget extends StatelessWidget {
  final icon;
  final double? width;
  final double? height;
  final double? iconSize;
  final void Function()? onTap;
  PrimaryIconWidget({super.key,this.onTap, required this.icon, this.width, this.height, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: width ?? 80,
        height: height ?? 80,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: iconSize ?? 32, color: AppColors.primary),
      ),
    );
  }
}
