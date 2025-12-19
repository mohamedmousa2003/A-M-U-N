import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_text_style.dart';

class DetailsRating extends StatelessWidget {
  final double? rating;
  final double sizeText;

  const DetailsRating({
    super.key,
    this.rating,
    this.sizeText = 16, // قيمة افتراضية
  });

  @override
  Widget build(BuildContext context) {
    final double safeRating = rating ?? 0.0; // لو null اعتبره 0
    int fullStars = safeRating.floor();
    bool hasHalfStar = (safeRating - fullStars) >= 0.5;

    return Row(
      children: [
        // النجوم
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: Colors.amber, size: 20.sp),
        if (hasHalfStar)
          Icon(Icons.star_half, color: Colors.amber, size: 20.sp),
        SizedBox(width: 4.w),
        // الرقم
        Text(
          safeRating.toStringAsFixed(1),
          style: AppTextStyle.size18.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: sizeText.sp,
          ),
        ),
      ],
    );
  }
}
