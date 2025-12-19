import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class HomeItemWidget extends StatelessWidget {
  final String? image;
  final String? price;
  final String location;
  final double sizeNum;
  final double textNum;
  final double rating;
  final bool showOnlyOneStar;
  final double sizeNumRating;
  final double sizeText;
  final VoidCallback? onTap;

  final bool isFavourite; // ← أضفنا
  final VoidCallback? onFavouriteTap; // ← أضفنا

  const HomeItemWidget({
    super.key,
    this.image,
    this.price,
    required this.location,
    this.sizeNum = 26,
    this.textNum = 18,
    this.sizeNumRating = 30,
    this.sizeText = 20,
    required this.rating,
    this.showOnlyOneStar = false,
    required this.onTap,
    this.isFavourite = false, // default false
    this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: NetworkImage(image ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            // Location row
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: sizeNum, color: AppColor.black),
                SizedBox(width: 3.w),
                Expanded(
                  child: Text(
                    location,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold, fontSize: textNum),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            // Rating and price
            Row(
              children: [
                if (showOnlyOneStar)
                  Icon(Icons.star_rate_rounded, color: AppColor.yellow, size: sizeNum)
                else ...[
                  for (int i = 0; i < fullStars; i++)
                    Icon(Icons.star_rate_rounded, color: AppColor.yellow, size: sizeNum),
                  if (hasHalfStar)
                    Icon(Icons.star_half_rounded, color: AppColor.yellow, size: sizeNum),
                ],
                SizedBox(width: 8.w),
                Text(rating.toString(), style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold, fontSize: sizeText)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price ?? '', style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: onFavouriteTap,
                    child: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      size: 30.sp,
                      color: isFavourite ? Colors.red : AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
