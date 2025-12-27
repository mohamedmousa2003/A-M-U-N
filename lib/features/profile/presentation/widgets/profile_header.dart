import 'package:amun/features/profile/presentation/widgets/profile_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_extention.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../pages/profile_setting.dart';
import 'click_image.dart';
import 'design_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.primary, AppColor.primary.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
      GestureDetector(
      onTap: () {
    showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.8),
    builder: (context) {
    return AnimatedImageDialog();
    },
    );
    },
      child: CircleAvatar(
        radius: 45.r,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: DesignImage(
            width: 80.w,
            height: 80.h,
          ),
        ),
      ),
      ),

              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed Mousa",
                      style: AppTextStyle.size20.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "mohamedmousa1152003@gmail.com",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.size14.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 16.h),
          const ProfileStats(),
          SizedBox(height: 14.h),
          ElevatedButton.icon(
            onPressed: () => context.pushNamed(ProfileImageSetting.routeName),
            icon: const Icon(Icons.edit),
            label: const Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}
