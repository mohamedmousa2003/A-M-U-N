import '../../domain/entities/trip_entity.dart';

abstract class TripState {}

class TripInitial extends TripState {}

class TripLoading extends TripState {}

class TripLoaded extends TripState {
  final TripEntity trip;
  TripLoaded(this.trip);
}

class TripError extends TripState {
  final String message;
  TripError(this.message);
}
