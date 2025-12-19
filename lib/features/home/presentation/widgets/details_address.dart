import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsAddress extends StatelessWidget {
  final String? address;

  const DetailsAddress({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.location_on, size: 18.sp),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(address ?? "", style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
