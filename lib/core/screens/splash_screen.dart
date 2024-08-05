import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/modules/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../constants/assets/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: double.infinity,
        animationDuration: const Duration(milliseconds: 1000),
        splashTransition: SplashTransition.slideTransition,
        curve: Curves.easeInOut,
        splash: Center(child: Image.asset(AppImages.logoPng, height: 200.h)),
        nextScreen: const SignInScreen(),
      ),
    );
  }
}
