import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const ProfileItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColor.primary),
      title: Text(title, style: AppTextStyle.size18),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
      onTap: onTap,
    );
  }
}
