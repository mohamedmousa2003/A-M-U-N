import 'package:amun/features/trip/data/data_sources/remote/trip_remote_data_source.dart';
import 'package:amun/features/trip/domain/entities/trip_entity.dart';
import 'package:amun/features/trip/domain/repositories/trip_repository.dart';
import '../../../../core/extensions/trip_entity_extensions.dart';
class TripRepositoryImpl implements TripRepository {
  final TripRemoteDataSource tripRemoteDataSource;

  TripRepositoryImpl(this.tripRemoteDataSource);

  @override
  Future<TripEntity> getTripPlan({int numberOfDays = 0, double budget = 0}) async {
    try {
      final tripModel = await tripRemoteDataSource.getTripPlan(
        numberOfDays: numberOfDays,
        budget: budget,
      );
      return tripModel.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}