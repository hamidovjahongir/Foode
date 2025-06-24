import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foode/core/extension/size_extension.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/core/utils/app_images.dart';
import 'package:foode/core/utils/constants/app_text_style.dart';
import 'package:foode/core/widget/my_button.dart';
import 'package:foode/features/auth/presentation/pages/login_page.dart';
import 'package:foode/features/auth/presentation/widgets/my_textformfild.dart';
import 'package:foode/features/auth/presentation/widgets/textfild_message.dart';

import '../widgets/my_contaner_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                SvgPicture.asset(AppImages.authLogo),
                Text(
                  'Sign up for free',
                  style: AppTextStyles.s22w600.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                35.height,
                CustomTextFormField(
                  controller: emailController,
                  labelText: '    Email',
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: 30,
                  labelStyle: AppTextStyles.s16w600.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.blackTextColor,
                  ),

                  hintText: 'Email or Phone Number',
                ),
                15.height,
                TextfildMessage(title: 'This is a message'),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: passwordController,

                  labelText: '    Password',
                  borderRadius: 30,
                  labelStyle: AppTextStyles.s16w600.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.blackTextColor,
                  ),
                  hintText: 'Password',
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: AppColors.lightWhite,
                  ),
                ),
                20.height,

                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      checkColor: AppColors.neutralBlack,
                      activeColor: AppColors.primaryRed,
                    ),
                    Text(
                      "Remember me",
                      style: AppTextStyles.s14w600.copyWith(
                        color: AppColors.neutralBlack,
                      ),
                    ),
                  ],
                ),
                20.height,

                MyButton(title: 'Sign in', color: AppColors.red, height: 60),
                20.height,

                Text(
                  'Forgot the password?',
                  style: AppTextStyles.s16w600.copyWith(),
                ),
                35.height,
                Text('or continue with'),
                24.height,

                Row(
                  spacing: 25,
                  children: [
                    MyContanerWidget(
                      height: 60,
                      picture: SvgPicture.asset(AppImages.facebook),
                      title: 'Facebook',
                      radius: 12,
                    ),
                    MyContanerWidget(
                      height: 60,
                      picture: SvgPicture.asset(AppImages.google),
                      title: 'Google',
                      radius: 12,
                    ),
                  ],
                ),
                35.height,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (x) => LoginPage()),
                    );
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Text(
                        'Already have an account?',
                        style: AppTextStyles.s16w600.copyWith(
                          color: AppColors.lightWhite,
                        ),
                      ),
                      Text(
                        'Sign in',
                        style: AppTextStyles.s16w600.copyWith(
                          color: AppColors.primaryRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
