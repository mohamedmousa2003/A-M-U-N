import 'package:amun/features/profile/presentation/widgets/profile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_text_style.dart';

class ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ProfileSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.size21),
        SizedBox(height: 12.h),
        ProfileCard(children: children),
      ],
    );
  }
}
