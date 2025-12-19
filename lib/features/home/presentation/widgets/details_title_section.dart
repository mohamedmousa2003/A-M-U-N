import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTitleSection extends StatelessWidget {
  final String? name;
  final String? type;

  const DetailsTitleSection({
    super.key,
    this.name,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name ?? "",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (type != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              type!,
              style: TextStyle(color: Colors.blue, fontSize: 12.sp),
            ),
          ),
      ],
    );
  }
}
