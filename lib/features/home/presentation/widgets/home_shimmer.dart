import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerItem extends StatelessWidget {
  const HomeShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      margin: EdgeInsets.only(right: 14.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE + FAVORITE
            Stack(
              children: [
                Container(
                  height: 140.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            /// TITLE
            Container(
              height: 14.h,
              width: 130.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),

            SizedBox(height: 8.h),

            /// PRICE
            Container(
              height: 12.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),

            SizedBox(height: 8.h),

            /// RATING
            Row(
              children: List.generate(
                4,
                    (index) => Container(
                  margin: EdgeInsets.only(right: 6.w),
                  height: 10.h,
                  width: 18.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
