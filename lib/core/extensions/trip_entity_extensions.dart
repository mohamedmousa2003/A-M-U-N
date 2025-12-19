import 'package:amun/core/extensions/trip_plan_model_mapper.dart';

import '../../features/trip/data/models/TripModel.dart';
import '../../features/trip/domain/entities/trip_entity.dart';

extension TripModelMapper on TripModel {
  TripEntity toEntity() {
    return TripEntity(
      arrivalAirport: arrivalAirport ?? '',
      bestTimeToVisit: bestTimeToVisit ?? '',
      suggestedMonth: suggestedMonth ?? '',
      totalCost: totalCost ?? 0,
      tripPlan: tripPlan?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
