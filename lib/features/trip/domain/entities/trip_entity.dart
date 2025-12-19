import 'package:amun/features/trip/domain/entities/trip_plan_entity.dart';

class TripEntity {
  final String arrivalAirport;
  final String bestTimeToVisit;
  final String suggestedMonth;
  final List<TripPlanEntity> tripPlan;
  final int totalCost;

  TripEntity({
    required this.arrivalAirport,
    required this.bestTimeToVisit,
    required this.suggestedMonth,
    required this.tripPlan,
    required this.totalCost,
  });
}
