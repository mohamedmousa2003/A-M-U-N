import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class ProfileStatItem extends StatelessWidget {
  final String title;
  final String value;

  const ProfileStatItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyle.size20.copyWith(
            color: AppColor.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: AppTextStyle.size14.copyWith(
            color: AppColor.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
