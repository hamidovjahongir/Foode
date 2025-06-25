import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foode/core/extension/size_extension.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/app_images.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';
import 'package:foode/core/widget/my_button.dart';

class SuccessfulPage extends StatefulWidget {
  const SuccessfulPage({super.key});

  @override
  State<SuccessfulPage> createState() => _SuccessfulPageState();
}

class _SuccessfulPageState extends State<SuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppImages.successful),
                  25.height,
                  Text(
                    'Password reset successful',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s18w400.copyWith(
                      color: AppColors.neutralBlack,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MyButton(
                title: 'OK',
                color: AppColors.red,
                height: 55,
                onTap: () {
                  Navigator.pop(context); // kerakli sahifaga qaytish
                },
              ),
              24.height,
            ],
          ),
        ),
      ),
    );
  }
}
