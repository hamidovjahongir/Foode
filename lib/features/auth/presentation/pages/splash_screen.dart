import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/features/auth/data/datasource/local_datasource.dart';
import 'package:task_for_uicgroup/features/profile/data/repository/user_local_repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();
  final UserLocalRepository userLocalRepository = UserLocalRepository();

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  // Sizning eski funksiyangizni shu yangi versiya bilan almashtiring:

  Future<void> _checkAuthStatus() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      print('Auth tekshirish boshlandi...');

      final user = FirebaseAuth.instance.currentUser;
      final savedToken = await authLocalDatasource.getToken();
      final savedUserId = await userLocalRepository.getUserId();

      print('Firebase User: ${user?.email ?? 'null'}');
      print('Saved Token: ${savedToken != null ? 'Mavjud' : 'Yo\'q'}');
      print('Saved User ID: ${savedUserId ?? 'null'}');
      print('Mounted: $mounted');

      if (user != null && savedToken != null && savedUserId != null) {
        print('Barcha ma\'lumotlar mavjud - Home ga o\'tish');
        if (!mounted) return;
        context.goNamed(AppRoutesNames.home);
        return;
      }

      if (user != null) {
        print('Firebase user mavjud, local ma\'lumotlarni yangilash');
        try {
          final newToken = await user.getIdToken(true);
          await authLocalDatasource.saveToken(newToken.toString());
          await userLocalRepository.saveUserId(user.uid);

          print('Ma\'lumotlar yangilandi - Home ga o\'tish');
          if (!mounted) return;
          context.goNamed(AppRoutesNames.home);
          return;
        } catch (tokenError) {
          print('Token yangilashda xatolik: $tokenError');
          if (!mounted) return;
          context.goNamed(AppRoutesNames.home);
          return;
        }
      }

      if (savedToken != null || savedUserId != null) {
        print('Faqat local ma\'lumotlar bor, tozalash');
        await authLocalDatasource.removeToken();
        await userLocalRepository.removeUserId();
      }
      print('Onboarding ga otish');
      if (!mounted) return;
      context.goNamed(AppRoutesNames.onboarding);
    } catch (error) {
      print('Auth tekshirishda umumiy xatolik: $error');
      if (!mounted) return;
      context.goNamed(AppRoutesNames.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.backgroundImage, fit: BoxFit.cover),
          ),
          Center(child: Image.asset(Assets.logo)),
        ],
      ),
    );
  }
}
