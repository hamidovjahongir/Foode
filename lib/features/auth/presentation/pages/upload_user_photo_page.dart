import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foode/core/extension/size_extension.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';
import 'package:foode/core/widget/my_button.dart';
import 'package:foode/features/auth/presentation/widgets/my_arrow_button.dart';
import 'package:foode/features/auth/presentation/widgets/upload_widget.dart';

class UploadUserPhotoPage extends StatefulWidget {
  const UploadUserPhotoPage({super.key});

  @override
  State<UploadUserPhotoPage> createState() => _UploadUserPhotoPageState();
}

class _UploadUserPhotoPageState extends State<UploadUserPhotoPage> {
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
                  'Upload your photo',
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
            30.height,
            UploadWidget(
              color: Colors.white,
              icon: Icon(Icons.folder, size: 32, color: AppColors.primaryRed),
              title: 'Take photo',
            ),
            25.height,
            UploadWidget(
              color: Colors.white,
              icon: Icon(
                Icons.camera_alt,
                size: 32,
                color: AppColors.primaryRed,
              ),
              title: 'From gallery',
            ),
            Spacer(),
            MyButton(title: 'Next', color: AppColors.red, height: 60),
            50.height,
          ],
        ),
      ),
    );
  }
}
