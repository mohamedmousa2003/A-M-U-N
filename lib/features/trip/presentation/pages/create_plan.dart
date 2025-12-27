import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../home/presentation/widgets/google_map_tile.dart';
import '../../../home/presentation/widgets/google_search_tile.dart';
import '../../data/models/TripModel.dart';
import '../../domain/entities/Places_entity.dart';
import '../../domain/entities/trip_entity.dart';

class CreatePlan extends StatelessWidget {
  final PlacesEntity? place;

  const CreatePlan({super.key, this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.white,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: Text(place!.name ??"",style: AppTextStyle.size21)),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    place?.image ??"",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.broken_image, size: 100),
                  ),
                ),
                SizedBox(height: 16.h,),
                Text(place!.name , style: AppTextStyle.size21.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 16.h,),
                Text("📍 Address: ${place!.address}", style: AppTextStyle.size16),
                SizedBox(height: 16.h,),

                Text("🏷️ Type: ${place!.type}", style: AppTextStyle.size16),
                SizedBox(height: 8.h,),
                Text("💰 Cost: ${place!.cost} EGP", style: AppTextStyle.size16),
                SizedBox(height: 8.h,),
                Text("⭐ Rating: ${place!.rating}", style: AppTextStyle.size16),
                SizedBox(height: 8.h,),

                Text("📌 Coordinates:", style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h,),
                Text("Latitude: ${place!.latitude}", style: AppTextStyle.size14),
                SizedBox(height: 4.h,),
                Text("Longitude: ${place!.longitude}", style: AppTextStyle.size14),
                SizedBox(height: 10.h,),

                Text("🕐 Opening Hours: ${place!.openingHours}", style: AppTextStyle.size18),
                SizedBox(height: 4.h,),
                Text("🕔 Best Time to Visit: ${place!.bestTimeToVisit}", style: AppTextStyle.size18),
                SizedBox(height: 4.h,),
                Text("⏳ Visit Duration: ${place!.visitDuration}", style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 10.h,),

                Text("🎯 Recommended Activities:", style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold)),
                Text(place!.recommendedActivities, style: AppTextStyle.size16),
                SizedBox(height: 10.h,),

                Text("📝 Description:", style: AppTextStyle.size18.copyWith(fontWeight: FontWeight.bold)),
                Text(place!.description, style: AppTextStyle.size16),
                SizedBox(height: 16.h,),
                MyGoogleMapLink(text: place!.name,),
                const SizedBox(height: 8),
                MyGoogleLink(text: place!.name,),
              ],
            ),
          )

      ),
    );
  }
}

class PlanTripScreen extends StatelessWidget {
  static const String routeName = "planTrip";

  const PlanTripScreen({super.key, required this.tripPlan});
  final TripEntity tripPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(title: const Text("Your Trip Plan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTripInfo(tripPlan),
            const SizedBox(height: 20),
            ...tripPlan.tripPlan.map(
                  (day) => Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  title: Text(
                    day.day,
                    style: AppTextStyle.size18.copyWith(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: day.places
                      .map((place) => _buildPlaceTile(context, place))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripInfo(TripEntity trip) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow("✈️ Arrival Airport", trip.arrivalAirport),
          _infoRow("📅 Best Time to Visit", trip.bestTimeToVisit),
          _infoRow("🗓️ Suggested Month", trip.suggestedMonth),
          _infoRow("💰 Total Cost", "${trip.totalCost} EGP"),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: AppTextStyle.size14.copyWith(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Text(value,
                style: AppTextStyle.size14.copyWith(color: Colors.grey[700])),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceTile(BuildContext context, PlacesEntity place) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          place.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) =>
          const Icon(Icons.image_not_supported_outlined),
        ),
      ),
      title: Text(place.name, style: AppTextStyle.size16),
      subtitle: Text(place.address, style: TextStyle(color: Colors.grey[600])),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16,color: AppColor.primary,),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CreatePlan(place: place),
          ),
        );
      },
    );
  }

}
