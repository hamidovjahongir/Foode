import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Image.asset(
                  AppImages.splash1,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenHeight * 0.05,
                  ),
                  child: SvgPicture.asset(
                    AppImages.splashSvgLogo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
