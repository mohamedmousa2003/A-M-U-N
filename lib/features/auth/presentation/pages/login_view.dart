import 'dart:developer';
import 'package:amun/features/auth/presentation/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/icon_assets.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/extensions/context_extention.dart';
import '../../../../core/layout/bottom_nav_screen.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/components/main_text_form_field.dart';
import '../animation/auth_animation.dart';
import '../animation/select_auth_animation_impl.dart';
import '../widgets/have_not_account.dart';
import '../widgets/material_button_widget.dart';
import 'forget_password.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'login';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin{
  late final AuthAnimation _animation;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(text: "");
  final TextEditingController _passwordController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _animation = SelectAuthAnimationImpl(vsync: this);
    _animation.start();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.primary, size: 30),
          titleTextStyle: AppTextStyle.size21.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SlideTransition(
                  position: _animation.left,
                  child: Row(
                    children: [
                      Text(welcomeLoginBack, style: AppTextStyle.size24),
                      SizedBox(width: 8.h,),
                      Image.asset(
                        IconsPng.welcomeBack,
                        width: 30.w,
                        height: 30.h,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h,),
                SlideTransition(
                  position: _animation.right,
                  child: Text(
                    desWelcomeBack,
                    style: AppTextStyle.size14.copyWith(color: AppColor.black),
                  ),
                ),
                SizedBox(height: 40.h,),

                /// Email Field
                SlideTransition(
                  position: _animation.left,
                  child: TextFormFieldWidget(
                    hintText: enterYourEmail,
                    title: email,
                    controller: _emailController,
                    myValidator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Email is required';
                      }
                      // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                      //     .hasMatch(text)) {
                      //   return 'Enter a valid email address';
                      // }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20.h,),
                /// Password Field
                SlideTransition(
                  position: _animation.right,
                  child: TextFormFieldWidget(
                    hintText: " * * * * * * * *",
                    isPassword: true,
                    obscureText: true,
                    title: password,
                    controller: _passwordController,
                    myValidator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Password is required';
                      }
                      if (text.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 12.h,),

                /// Forgot password
                SlideTransition(
                  position: _animation.left,
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(ForgetPassword.routeName);
                    },
                    child: Text(
                      textAlign: TextAlign.right,
                      forgotPassword,
                      style: AppTextStyle.size14.copyWith(
                        color: AppColor.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),

                /// Login Button
                SlideTransition(
                  position: _animation.right,
                  child: MaterialButtonWidget(
                    onPressed: _submitForm,
                    title: "login",
                  ),
                ),
                SizedBox(height: 30.h,),

                /// Register Navigation
                SlideTransition(
                  position: _animation.bottom,
                  child: HaveOrNotAccount(
                    question: noHaveAccount,
                    navigateTo: register,
                    onTap: () {
                      context.pushNamedAndRemoveUntil(RegisterScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      // TODO: Use email & password for login logic
      log("Login pressed with email: $email and password: $password");
      login(email,password);
    }
  }


  void login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        debugPrint('Login successful: ${credential.user!.uid}');
        Navigator.of(context).pushReplacementNamed(MainBottomNavBar.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      } else {
        debugPrint('Login failed: ${e.message}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }



}
