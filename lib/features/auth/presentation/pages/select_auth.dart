import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icon_assets.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/layout/bottom_nav_screen.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../animation/auth_animation.dart';
import '../animation/select_auth_animation_impl.dart';
import '../widgets/material_button_widget.dart';
import 'login_view.dart';

class SelectAuthScreen extends StatefulWidget {
  static const String routeName = 'select_auth';


  const SelectAuthScreen({super.key});

  @override
  State<SelectAuthScreen> createState() => _SelectAuthScreenState();
}

class _SelectAuthScreenState extends State<SelectAuthScreen> with TickerProviderStateMixin {
  late final AuthAnimation _animation;



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
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SlideTransition(
                position: _animation.top,
                child: SvgPicture.asset(IconsSvg.getStare),
              ),
              SizedBox(height: 50.h),
              SlideTransition(
                position: _animation.left,
                child: MaterialButtonWidget(
                  onPressed: () => Navigator.pushReplacementNamed( context,LoginView.routeName),
                  title:createAccount,
                ),
              ),
              SizedBox(height: 20.h),
              SlideTransition(
                position: _animation.right,
                child: MaterialButtonWidget(

                  onPressed: () => Navigator.pushReplacementNamed( context,LoginView.routeName),
                  title: login,
                ),
              ),
              SizedBox(height: 30.h),
              SlideTransition(
                position: _animation.bottom,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed( context,MainBottomNavBar.routeName),
                  child: Text(
                    continueAsGuest,
                    style: AppTextStyle.size18.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
