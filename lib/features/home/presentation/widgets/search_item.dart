import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/images_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class SearchItem extends StatelessWidget {
  final String name;
  final String email;
  final String imageAsset;
  final VoidCallback? onLogoTap;

  const SearchItem({
    super.key,
    this.name = "Mohamed Mousa",
    this.email = "mohamedmousa11520031@gmail.com",
    this.imageAsset = ImagePng.profileScreen,
    this.onLogoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: DesignImage(
              width: 80.w,
              height: 80.h,
              imageAsset: imageAsset,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyle.size21.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 4.h),
              Text(
                email,
                style: AppTextStyle.size16.copyWith(
                  color: AppColor.grayWhite,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: onLogoTap,
          child: const Logo(),
        ),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  final double width;
  final double height;
  final double imageSize;
  final Color colorBorder;

  const Logo({
    super.key,
    this.width = 55,
    this.height = 55,
    this.imageSize = 40,
    this.colorBorder = AppColor.lightGray,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: AppColor.white,
        shape: BoxShape.circle,
        border: Border.all(color: colorBorder, width: 2),
      ),
      child: Center(
        child: Image.asset(
          ImagePng.logo,
          width: imageSize.w,
          height: imageSize.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class DesignImage extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;
  final String imageAsset;

  const DesignImage({
    super.key,
    required this.width,
    required this.height,
    this.isCircle = true,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
