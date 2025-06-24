import 'package:flutter/material.dart';
import 'package:foode/core/utils/app_images.dart';
import 'package:foode/features/splash/presentation/pages/second_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (x) => SecondPage()));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(AppImages.splashLogo)),
    );
  }
}
