import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final List<Widget> children;

  const ProfileCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.grayCard,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: children
            .expand((e) => [e, const Divider()])
            .toList()
          ..removeLast(),
      ),
    );
  }
}
