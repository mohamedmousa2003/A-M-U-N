import 'package:amun/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/extensions/context_extention.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../layout/bottom_nav_screen.dart';
import '../../data/Model/onboarding_item.dart';
import '../../data/onboarding_data.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({
    super.key,
    required this.item,
    required this.index,
    required this.pageController,
    required this.isLastPage,
  });

  final OnboardingItem item;
  final int index;
  final PageController pageController;
  final ValueNotifier<bool> isLastPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Skip button
        !isLastPage.value ?
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => pageController.jumpToPage(
                OnboardingData.items.length - 1,
              ),
              child: Text(
                skip,
                style: AppTextStyle.size16.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),
          )
        : SizedBox.shrink(),

        /// Image
        SvgPicture.asset(
          item.imagePath,
          height: 260.h,
          fit: BoxFit.contain,
        ),

        /// Indicator
        SmoothPageIndicator(
          controller: pageController,
          count: OnboardingData.items.length,
          effect: SlideEffect(
            spacing: 12.w,
            radius: 6.r,
            dotWidth: 28.w,
            dotHeight: 8.h,
            dotColor: AppColor.gray,
            activeDotColor: AppColor.primary,
          ),
        ),

        /// Title
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: AppTextStyle.size24,
        ),

        /// Description
        Text(
          item.description,
          textAlign: TextAlign.center,
          style: AppTextStyle.size14,
        ),

        /// Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (index != 0)
              TextButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  back,
                  style: AppTextStyle.size16.copyWith(
                    color: AppColor.primary,
                  ),
                ),
              )
            else
              const SizedBox(),

            ValueListenableBuilder<bool>(
              valueListenable: isLastPage,
              builder: (_, last, __) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    if (last) {
                      context.pushNamedAndRemoveUntil(
                        MainBottomNavBar.routeName,
                      );
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    last ? getStarted : next,
                    style: AppTextStyle.size16.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
