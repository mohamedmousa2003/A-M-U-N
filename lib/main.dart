import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/layout/bottom_nav_screen.dart';
import 'features/onboarding/presentation/pages/onboarding_view.dart';
import 'features/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: "A M U N",
          debugShowCheckedModeBanner: false,
          initialRoute: OnboardingView.routeName,
          routes: {
            SplashView.routeName: (context) => SplashView(),
            OnboardingView.routeName: (context) => OnboardingView(),
            MainBottomNavBar.routeName :(context) =>MainBottomNavBar(),
          },
        );
      },
    );
  }
}
