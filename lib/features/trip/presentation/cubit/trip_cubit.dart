import 'package:bloc/bloc.dart';
import '../../domain/entities/trip_entity.dart';
import '../../domain/use_cases/create_trip_use_cases.dart';
import 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  final CreateTripUseCase repository;

  TripCubit(this.repository) : super(TripInitial());

  Future<void> fetchTrip({required int days, required double budget}) async {
    try {
      emit(TripLoading());
      final TripEntity trip = await repository.call(
        numberOfDays: days,
        budget: budget,
      );
      emit(TripLoaded(trip));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }
}
