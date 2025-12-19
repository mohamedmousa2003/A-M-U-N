// hotel_item_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class HotelItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String checkIn;
  final String checkOut;

  const HotelItemWidget({
    super.key,
    required this.title,
    required this.checkIn,
    required this.checkOut,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Hotel Title
            Text(
              title,
              style: AppTextStyle.size18.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20.h),


            /// Check-In / Check-Out
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Check In\t\t\t\t",
                      style: AppTextStyle.size14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.gray,  ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      checkIn,
                      style: AppTextStyle.size14.copyWith(color: AppColor.gray),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Check Out",
                      style: AppTextStyle.size14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.gray,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      checkOut,
                      style: AppTextStyle.size14.copyWith(color: AppColor.gray),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),

            /// Button / CTA (optional)
            Center(
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
                child: Text(
                  "View Details",
                  style: AppTextStyle.size14.copyWith(color: AppColor.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
