import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class MyGoogleMapLink extends StatelessWidget {
  static String routeName = "google_map";
  final String text;

  const MyGoogleMapLink({super.key, required this.text});

  Future<void> _launchMap() async {
    final Uri mapUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(text)}',
    );

    if (!await launchUrl(mapUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $mapUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h,),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _launchMap,
          borderRadius: BorderRadius.circular(20.r),
          splashColor: Colors.blue.withOpacity(0.2),
          highlightColor: Colors.blue.withOpacity(0.1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                colors: [Colors.blue.shade50, Colors.blue.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: const Icon(Icons.map, color: Colors.white, size: 28),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Text(
                    "Open in Google Maps $text",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
