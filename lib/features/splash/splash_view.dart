import 'package:flutter/material.dart';

import '../../core/constant/images_assets.dart';
import '../onboarding/presentation/pages/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = "Splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAB489),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCFC4A5),
        toolbarHeight: 100,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset(
            ImagePng.splashScreen,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
