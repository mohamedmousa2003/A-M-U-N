import '../entities/trip_entity.dart';
import '../repositories/trip_repository.dart';

class CreateTripUseCase {
  final TripRepository repository;

  CreateTripUseCase(this.repository);

  Future<TripEntity> call({
    required int numberOfDays,
    required double budget,
  }) {
    return repository.getTripPlan(
      numberOfDays: numberOfDays,
      budget: budget,
    );
  }
}
