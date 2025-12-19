import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/classical_entity.dart';
import '../../widgets/details_address.dart';
import '../../widgets/details_cost_card.dart';
import '../../widgets/details_description.dart';
import '../../widgets/details_header.dart';
import '../../widgets/details_rating.dart';
import '../../widgets/details_title_section.dart';
import '../../widgets/google_map_tile.dart';
import '../../widgets/google_search_tile.dart';

class ClassicalDetailsScreen extends StatelessWidget {
  final ClassicalEntity classical;
  static const routeName = "ClassicalDetailsScreen";

  const ClassicalDetailsScreen({
    super.key,
    required this.classical,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          DetailsHeader(imageUrl: classical.imageUrl),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsTitleSection(
                    name: classical.name,
                    type: classical.type,
                  ),

                  SizedBox(height: 8.h),
                  DetailsRating(rating: classical.rating),
                  SizedBox(height: 12.h),
                  DetailsAddress(address: classical.address),
                  SizedBox(height: 20.h),

                  DetailsDescription(description: classical.description),
                  SizedBox(height: 24.h),

                  DetailsCostCard(cost: classical.cost),
                  SizedBox(height: 24.h),

                  MyGoogleMapLink(text: classical.name ?? ""),
                  SizedBox(height: 8.h),
                  MyGoogleLink(text: classical.name ?? ""),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
