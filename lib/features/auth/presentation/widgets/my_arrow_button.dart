import 'package:flutter/material.dart';
import 'package:foode/core/utils/app_colors.dart';

// ignore: must_be_immutable
class MyArrowButton extends StatelessWidget {
  void Function()? onTap;
  MyArrowButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryRed.withOpacity(0.2),
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          weight: 20,
          color: AppColors.primaryRed,
        ),
      ),
    );
  }
}
