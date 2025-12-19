import '../../models/TripModel.dart';

abstract class TripRemoteDataSource {
  Future<TripModel> getTripPlan({
    required int numberOfDays,
    required double budget,
  });
}
