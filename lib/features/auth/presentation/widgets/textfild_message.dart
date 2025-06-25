import 'package:flutter/material.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';

class TextfildMessage extends StatelessWidget {
  final String title;

  TextfildMessage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.neutralWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          spacing: 10,
          children: [
            Icon(Icons.error, color: AppColors.blackTextColor),
            Text(
              title,
              style: AppTextStyles.s14w400.copyWith(
                color: AppColors.blackTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
