
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../widgets/click_image.dart';
import '../widgets/custom_card.dart';
import '../widgets/design_image.dart';


class ProfileImageSetting extends StatelessWidget {
  static const String routeName = "profileImage";
  const ProfileImageSetting({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.white,
      ),
      backgroundColor: AppColor.white,
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.8),
                    builder: (context) {
                      return AnimatedImageDialog();
                    },
                  );
                },
                child: DesignImage(
                  width: 200.w,
                  height: 200.w,
                  isCircle: true,
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Center(
              child: Text("Edit" ,style: AppTextStyle.size23.copyWith(
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 30.h,),
            Text("Name",style: AppTextStyle.size18.copyWith(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 3.h,),
            CustomCard(
              // name:SharedPrefsService.getString("name")??
              name: "Name",
            ),
            SizedBox(height: 3.h,),
            Text("Email",style: AppTextStyle.size18.copyWith(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 3.h,),
            CustomCard(
              // name: SharedPrefsService.getString("email")??
              name: "email",
            ),
          ],
        ),
      ),
    );
  }
}

