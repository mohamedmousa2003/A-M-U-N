import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class LogoutTile extends StatelessWidget {
  final VoidCallback? onTap;

  const LogoutTile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: Text(
          "Logout",
          style: AppTextStyle.size18.copyWith(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.red,
        ),
        onTap: onTap,
      ),
    );
  }
}
