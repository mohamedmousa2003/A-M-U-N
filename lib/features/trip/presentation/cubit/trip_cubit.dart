import 'package:bloc/bloc.dart';
import '../../domain/entities/trip_entity.dart';
import '../../domain/repositories/trip_repository.dart';
import 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  final TripRepository repository;

  TripCubit(this.repository) : super(TripInitial());

  Future<void> fetchTrip({required int days, required double budget}) async {
    try {
      emit(TripLoading());
      final TripEntity trip = await repository.getTripPlan(
        numberOfDays: days,
        budget: budget,
      );
      emit(TripLoaded(trip));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }
}
