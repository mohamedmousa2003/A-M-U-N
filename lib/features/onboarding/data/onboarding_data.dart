import '../../../core/constant/icon_assets.dart';
import 'Model/onboarding_item.dart';

class OnboardingData {
  static final List<OnboardingItem> items = [
    OnboardingItem(
      imagePath: IconsSvg.onboarding1,
      title: 'Manage your journey',
      description:
      'Pack your bags! Your tourism adventure starts here with our new project.',
    ),
    const OnboardingItem(
      imagePath: IconsSvg.onboarding2,
      title: 'Discover tourist attractions',
      description:
      'Discover new opportunities to enjoy our rich heritage and stunning natural beauty.',
    ),
    const OnboardingItem(
      imagePath: IconsSvg.onboarding3,
      title: 'Golden sand',
      description:
      'Explore the most beautiful beaches and enjoy unforgettable moments.',
    ),
  ];
}
