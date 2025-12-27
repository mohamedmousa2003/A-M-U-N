import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/extensions/context_extention.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/components/main_text_form_field.dart';
import '../animation/auth_animation.dart';
import '../animation/select_auth_animation_impl.dart';
import '../widgets/have_not_account.dart';
import '../widgets/material_button_widget.dart';
import 'login_view.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName="register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin{
  late final AuthAnimation _animation;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController(text: "mohamed mousa");
  final TextEditingController _emailController = TextEditingController(text: "mousa@gmail.com");
  final TextEditingController _passwordController = TextEditingController(text: "123456789");
  final TextEditingController _confirmPasswordController = TextEditingController(text: "123456789");

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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h,),
                SlideTransition(
                    position: _animation.left,
                    child: Text(welcomeRegisterBack, style: AppTextStyle.size24)),
                SizedBox(height: 8.h,),
                SlideTransition(
                  position: _animation.right,
                  child: Text(
                    desWelcomeRegisterBack,
                    style: AppTextStyle.size14.copyWith(color: AppColor.black),
                  ),
                ),
                SizedBox(height: 40.h,),

                /// Full Name
                SlideTransition(
                  position: _animation.left,
                  child: TextFormFieldWidget(
                    hintText: enterYourFullName,
                    title: fullName,
                    controller: _fullNameController,
                    myValidator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Full name is required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 12.h,),

                /// Email
                SlideTransition(
                  position: _animation.right,
                  child: TextFormFieldWidget(
                    hintText: enterYourEmail,
                    title: email,
                    controller: _emailController,
                    myValidator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(text)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 12.h,),

                /// Password
                SlideTransition(
                  position: _animation.left,
                  child: TextFormFieldWidget(
                    hintText: " * * * * * * * *",
                    isPassword: true,
                    obscureText: true,
                    title: password,
                    controller: _passwordController,
                    myValidator: (text) {
                      if (text == null || text.trim().isEmpty) {
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

                /// Confirm Password
                SlideTransition(
                  position: _animation.right,
                  child: TextFormFieldWidget(
                    hintText: " * * * * * * * *",
                    isPassword: true,
                    obscureText: true,
                    title: confirmPassword,
                    controller: _confirmPasswordController,
                    myValidator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (text != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40.h,),

                /// Register Button
                SlideTransition(
                  position: _animation.left,
                  child: MaterialButtonWidget(
                    onPressed: _submitForm,
                    title: register,
                  ),
                ),
                SizedBox(height: 30.h,),

                /// Have account
                SlideTransition(
                  position: _animation.bottom,
                  child: HaveOrNotAccount(
                    question: haveAccount,
                    navigateTo: login,
                    onTap: () {
                      context.pushNamedAndRemoveUntil(LoginView.routeName);
                    },
                  ),
                ),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final fullName = _fullNameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confiremPassword = _confirmPasswordController.text.trim();
      // TODO: Register logic
      debugPrint('Registering: $fullName, $email, $password');
      _register(email, password);
    }
  }

  void _register(String email, String password)async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('register successful');
      debugPrint(credential.user!.uid??"");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

/*


try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}


 */