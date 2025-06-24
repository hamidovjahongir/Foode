import 'package:flutter/material.dart';
import 'package:foode/core/extension/size_extension.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/app_images.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';
import 'package:foode/core/widget/my_button.dart';
import 'package:foode/features/auth/presentation/pages/login_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppImages.lightSplash,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 50,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Foode',
                    style: AppTextStyles.s10w600.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 33,
                    ),
                  ),
                  16.height,
                  Text(
                    'The best food ordering and delivery app of the century',
                    style: AppTextStyles.s16w600.copyWith(color: Colors.white),
                  ),
                  50.height,
                  MyButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (x) => LoginPage()),
                      );
                    },
                    title: "Next",
                    titleColor: Colors.white,
                    color: AppColors.red,
                  ),
                ],
              ),
            ),
          ),
          55.height,
        ],
      ),
    );
  }
}
