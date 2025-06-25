import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foode/core/extension/size_extension.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';
import 'package:foode/core/widget/my_button.dart';
import 'package:foode/features/auth/presentation/widgets/my_arrow_button.dart';
import 'package:foode/features/auth/presentation/widgets/upload_widget.dart';

class SetUserLocationPage extends StatefulWidget {
  const SetUserLocationPage({super.key});

  @override
  State<SetUserLocationPage> createState() => _SetUserLocationPageState();
}

class _SetUserLocationPageState extends State<SetUserLocationPage> {
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
            35.height,
            UploadWidget(
              icon: Icon(Icons.location_on),
              title: 'Set location',
              color: Colors.white,
            ),
            Spacer(),
            MyButton(title: 'Next', color: AppColors.red, height: 55),
            50.height,
          ],
        ),
      ),
    );
  }
}
