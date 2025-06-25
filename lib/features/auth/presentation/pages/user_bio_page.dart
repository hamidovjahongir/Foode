import 'package:flutter/material.dart';
import 'package:foode/core/extension/size_extension.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';
import 'package:foode/core/widget/my_button.dart';
import 'package:foode/features/auth/presentation/widgets/my_arrow_button.dart';
import 'package:foode/features/auth/presentation/widgets/my_textformfild.dart';

class UserBio extends StatefulWidget {
  const UserBio({super.key});

  @override
  State<UserBio> createState() => _UserBioState();
}

class _UserBioState extends State<UserBio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 25,
              children: [
                MyArrowButton(onTap: () {}),
                Text(
                  'Fill in your bio',
                  style: AppTextStyles.s26w600.copyWith(
                    color: AppColors.neutralBlack,
                  ),
                ),
              ],
            ),
            30.height,
            Text(
              'This data will be displayed in your account profile for security',
              style: AppTextStyles.s16w400.copyWith(
                color: AppColors.neutralBlack,
              ),
            ),
            35.height,
            CustomTextFormField(
              labelText: 'Full Name',
              labelStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              hintText: 'Daniel Sebastian',
              hintStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: 30,
            ),
            20.height,
            CustomTextFormField(
              labelText: 'Nick Name',
              labelStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              hintText: 'Daniel',
              hintStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: 30,
            ),
            20.height,
            CustomTextFormField(
              labelText: 'Phone Number',
              labelStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              hintText: '+6282-4535-5639',
              hintStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: 30,
            ),
            20.height,
            CustomTextFormField(
              labelText: 'Gender',
              labelStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              hintText: 'Male',
              hintStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: 30,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.lightWhite,
                  weight: 24,
                ),
              ),
            ),
            20.height,
            CustomTextFormField(
              labelText: 'Date of Birth',
              labelStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              hintText: 'Daniel Sebastian',
              hintStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: 30,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.lightWhite,
                  weight: 24,
                ),
              ),
            ),
            20.height,
            CustomTextFormField(
              labelText: 'Address',
              labelStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              hintText: 'Bung Tomo St. 109',
              hintStyle: AppTextStyles.s16w600.copyWith(
                color: AppColors.neutralBlack,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: 30,
            ),
            20.height,
            MyButton(title: 'Next', color: AppColors.red, height: 55),
          ],
        ),
      ),
    );
  }
}
