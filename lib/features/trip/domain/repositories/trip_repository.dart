import '../entities/trip_entity.dart';

abstract class TripRepository {

  Future<TripEntity> getTripPlan({
    required int numberOfDays,
    required double budget,
  });

}
