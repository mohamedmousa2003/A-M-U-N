import 'package:amun/features/auth/presentation/pages/login_view.dart';
import 'package:amun/features/auth/presentation/pages/select_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/bloc_observer/BlocObserver.dart';
import 'core/layout/bottom_nav_screen.dart';
import 'features/Flight/presentation/pages/aire.dart';
import 'features/auth/presentation/pages/forget_password.dart';
import 'features/auth/presentation/pages/register.dart';
import 'features/chatBot/presentation/pages/chat_bot_page.dart';
import 'features/onboarding/presentation/pages/onboarding_view.dart';
import 'features/profile/presentation/pages/profile_setting.dart';
import 'features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Firebase
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
          initialRoute: SplashView.routeName,
          routes: {
            SplashView.routeName: (context) => SplashView(),
            OnboardingView.routeName: (context) => OnboardingView(),
            MainBottomNavBar.routeName :(context) => MainBottomNavBar(),
            ChatBotScreen.routeName :(context) => ChatBotScreen(),
            ProfileImageSetting.routeName :(context) => ProfileImageSetting(),
            FlightScreen.routeName :(context) =>  FlightScreen(),
            SelectAuthScreen.routeName :(context) => SelectAuthScreen(),
            LoginView.routeName :(context) => LoginView(),
            RegisterScreen.routeName :(context) => RegisterScreen(),
            ForgetPassword.routeName :(context) => ForgetPassword(),
          },
        );
      },
    );
  }
}
