import 'package:flutter/material.dart';
import 'package:foode/features/auth/presentation/pages/payment_page.dart';
import 'package:foode/features/auth/presentation/pages/select_location_page.dart';
import 'package:foode/features/auth/presentation/pages/set_user_location_page.dart';
import 'package:foode/features/auth/presentation/pages/successful_page.dart';
import 'package:foode/features/auth/presentation/pages/upload_user_photo.dart';
import 'package:foode/features/auth/presentation/pages/upload_user_photo_page.dart';
import 'package:foode/features/auth/presentation/pages/user_bio_page.dart';
import 'package:foode/features/splash/presentation/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectLocationPage(),
    );
  }
}
