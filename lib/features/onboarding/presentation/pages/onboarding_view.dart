import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/onboarding_data.dart';
import '../widgets/onboarding_page_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  static const String routeName="onboarding";

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  final ValueNotifier<bool> _isLastPage = ValueNotifier(false);

  @override
  void dispose() {
    _pageController.dispose();
    _isLastPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = OnboardingData.items;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        onPageChanged: (index) {
          _isLastPage.value = index == items.length - 1;
        },
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 40.h,
            ),
            child: OnboardingPageItem(
              item: items[index],
              index: index,
              pageController: _pageController,
              isLastPage: _isLastPage,
            ),
          );
        },
      ),
    );
  }
}
