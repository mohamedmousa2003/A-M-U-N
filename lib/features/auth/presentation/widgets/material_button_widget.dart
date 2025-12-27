import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.colorText,
    this.colorBackground,
    this.fontWeight,
    this.haveBorder = false,
    this.radius,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color? colorText;
  final Color? colorBackground;
  final FontWeight? fontWeight;
  final double? radius;
  final bool haveBorder;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 50.r),
        side: BorderSide(
          color: haveBorder ? AppColor.primary : Colors.transparent,
          width: 2.w,
        ),
      ),
      onPressed: onPressed,
      color: colorBackground ?? AppColor.primary,
      child: DefaultTextStyle(
        style: AppTextStyle.size18.copyWith(
          color: colorText ?? AppColor.white,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
        child: Text(title),
      ),
    );
  }
}
