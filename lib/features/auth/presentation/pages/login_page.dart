import 'package:flutter/material.dart';
import 'package:foode/core/utils/app_colors.dart';
import 'package:foode/features/auth/presentation/pages/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (x) => RegisterPage()),
                );
              },
              child: Row(
                spacing: 12,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: GoogleFonts.sourceSans3(
                      color: AppColors.lightWhite,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Sign up',
                    style: GoogleFonts.sourceSans3(
                      color: AppColors.redTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
