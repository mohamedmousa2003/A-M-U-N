import 'package:amun/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/entities/hotel_entity.dart';

class HotelDetailsScreen extends StatelessWidget {
  final HotelEntity hotel;
  static const String routeName = "HotelDetailsScreen";

  const HotelDetailsScreen({super.key, required this.hotel});

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openMap(double latitude, double longitude) async {
    final Uri mapUrl = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );
    if (!await launchUrl(mapUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $mapUrl';
    }
  }

  Widget _buildStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalf = (rating - fullStars) >= 0.5;
    List<Widget> stars = [];
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber, size: 18));
    }
    if (hasHalf) stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 18));
    return Row(children: stars);
  }

  Widget _buildExpandableTile(String title, String content) {
    return ExpansionTile(
      title: Text(title, style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.bold)),
      children: [Padding(padding: EdgeInsets.all(8.w), child: Text(content, style: AppTextStyle.size14))],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          /// HEADER IMAGE
          SliverAppBar(
            expandedHeight: 150.h,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                textAlign: TextAlign.center,
                hotel.name ?? "",
                style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold),
              ),
              background: hotel.type != null
                  ? Stack(
                fit: StackFit.expand,
                children: [
                  Container(color: Colors.grey.shade300),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black45, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12.h,
                    left: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        hotel.type ?? "",
                        style: AppTextStyle.size14.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
                  : Container(color: Colors.grey),
            ),
          ),

          /// CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Rating + Reviews
                  Row(
                    children: [
                      _buildStars(hotel.overallRating ?? 0.0),
                      SizedBox(width: 6.w),
                      Text(
                        hotel.overallRating?.toStringAsFixed(1) ?? "0.0",
                        style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "(${hotel.reviews ?? 0} reviews)",
                        style: AppTextStyle.size14.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  /// Location + Map Button
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    child: ListTile(
                      leading: Icon(Icons.location_on, color: Colors.redAccent, size: 20.sp),
                      title: Text(
                        "${hotel.latitude ?? ""}, ${hotel.longitude ?? ""}",
                        style: AppTextStyle.size14.copyWith(fontWeight: FontWeight.w500),
                      ),
                      trailing: ElevatedButton.icon(
                        onPressed: () {
                          if (hotel.latitude != null && hotel.longitude != null) {
                            _openMap(hotel.latitude!, hotel.longitude!);
                          }
                        },
                        label: Text("View Map", style: AppTextStyle.size16.copyWith(color: AppColor.white)),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          backgroundColor: Colors.blue,
                      )),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  /// Check-In / Check-Out
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text("Check-In", style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.bold)),
                              Text(hotel.checkIn ?? "-", style: AppTextStyle.size14),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Check-Out", style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.bold)),
                              Text(hotel.checkOut ?? "-", style: AppTextStyle.size14),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  /// Amenities
                  if (hotel.amenities != null && hotel.amenities!.isNotEmpty) ...[
                    Text("Amenities", style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: hotel.amenities!
                          .map((e) => Chip(
                        label: Text(e, style: AppTextStyle.size14),
                        backgroundColor: Colors.green.shade50,
                        avatar: const Icon(Icons.check, color: Colors.green, size: 16),
                      ))
                          .toList(),
                    ),
                  ],
                  SizedBox(height: 16.h),

                  /// Excluded Amenities
                  if (hotel.excludedAmenities != null && hotel.excludedAmenities!.isNotEmpty) ...[
                    Text(
                      "Excluded Amenities",
                      style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.bold, color: Colors.redAccent),
                    ),
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: hotel.excludedAmenities!
                          .map((e) => Chip(
                        label: Text(e, style: AppTextStyle.size14),
                        backgroundColor: Colors.red.shade50,
                        avatar: const Icon(Icons.close, color: Colors.red, size: 16),
                      ))
                          .toList(),
                    ),
                  ],
                  SizedBox(height: 16.h),

                  /// Expandable Sections
                  if (hotel.essentialInfo != null)
                    _buildExpandableTile("Essential Info", hotel.essentialInfo!),
                  if (hotel.nearbyPlaces != null)
                    _buildExpandableTile("Nearby Places", hotel.nearbyPlaces!),
                  if (hotel.ratingsBreakdown != null)
                    _buildExpandableTile("Ratings Breakdown", hotel.ratingsBreakdown!),
                  if (hotel.reviewsBreakdown != null)
                    _buildExpandableTile("Reviews Breakdown", hotel.reviewsBreakdown!),
                  SizedBox(height: 16.h),

                  /// Pricing
                  if (hotel.lowestRate != null || hotel.totalLowest != null)
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                      color: Colors.orange.shade50,
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pricing",
                              style: AppTextStyle.size18.copyWith(
                                  fontWeight: FontWeight.bold, color: Colors.orange.shade800),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Lowest Rate",
                                        style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.w600)),
                                    SizedBox(height: 4.h),
                                    Text(hotel.lowestRate ?? "-", style: AppTextStyle.size14),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Before Taxes",
                                        style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.w600)),
                                    SizedBox(height: 4.h),
                                    Text(hotel.beforeTaxes ?? "-", style: AppTextStyle.size14),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Lowest",
                                        style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.w600)),
                                    SizedBox(height: 4.h),
                                    Text(hotel.totalLowest ?? "-", style: AppTextStyle.size14),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Before Taxes",
                                        style: AppTextStyle.size16.copyWith(fontWeight: FontWeight.w600)),
                                    SizedBox(height: 4.h),
                                    Text(hotel.totalBeforeTaxes ?? "-", style: AppTextStyle.size14),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 20.h),

                  /// Hotel Link Button
                  if (hotel.link != null)
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton.icon(
                        onPressed: () => _openLink(hotel.link!),
                        icon: const Icon(Icons.link, size: 25, color: AppColor.white),
                        label: Text(
                          "Open Hotel Link",
                          style: AppTextStyle.size16.copyWith(
                              fontWeight: FontWeight.bold, color: AppColor.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
