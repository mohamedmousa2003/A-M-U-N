import 'package:amun/features/home/domain/entities/riviera_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/details_address.dart';
import '../../widgets/details_cost_card.dart';
import '../../widgets/details_description.dart';
import '../../widgets/details_header.dart';
import '../../widgets/details_rating.dart';
import '../../widgets/details_title_section.dart';
import '../../widgets/google_map_tile.dart';
import '../../widgets/google_search_tile.dart';

class RivieraDetailsScreen extends StatelessWidget {
  final RivieraEntity riviera;
  const RivieraDetailsScreen({super.key ,required this.riviera});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          DetailsHeader(imageUrl: riviera.imageUrl),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsTitleSection(
                    name: riviera.name,
                    type: riviera.type,
                  ),

                  SizedBox(height: 8.h),
                  DetailsRating(rating: riviera.rating),
                  SizedBox(height: 12.h),
                  DetailsAddress(address: riviera.address),
                  SizedBox(height: 20.h),

                  DetailsDescription(description: riviera.description),
                  SizedBox(height: 24.h),

                  DetailsCostCard(cost: riviera.cost),
                  SizedBox(height: 24.h),
                  MyGoogleMapLink(text: riviera.name ?? ""),
                  SizedBox(height: 8.h),
                  MyGoogleLink(text: riviera.name ?? ""),
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
