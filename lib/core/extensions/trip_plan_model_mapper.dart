import 'package:amun/core/extensions/places_model.dart';
import '../../features/trip/data/models/TripModel.dart';
import '../../features/trip/domain/entities/trip_plan_entity.dart';

extension TripPlanModelMapper on TripPlan {
  TripPlanEntity toEntity() {
    return TripPlanEntity(
      day: day ?? '',
      places: places?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
