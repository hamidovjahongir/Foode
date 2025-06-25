import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foode/core/extension/size_extension.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/app_images.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';
import 'package:foode/core/widget/my_button.dart';
import 'package:foode/features/auth/presentation/widgets/my_arrow_button.dart';
import 'package:foode/features/auth/presentation/widgets/paymetode_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
                  'Payment method',
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
            PaymetodeWidget(
              picture: SvgPicture.asset(AppImages.paypal),
              color: Colors.white,
            ),
            24.height,
            PaymetodeWidget(
              picture: SvgPicture.asset(AppImages.visa),
              color: Colors.white,
            ),
            24.height,
            PaymetodeWidget(
              picture: SvgPicture.asset(AppImages.payonner),
              color: Colors.white,
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
