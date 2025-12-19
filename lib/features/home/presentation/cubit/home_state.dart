import '../../domain/entities/classical_entity.dart';
import '../../domain/entities/hotel_entity.dart';
import '../../domain/entities/riviera_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HotelsLoading extends HomeState {
  final List<HotelEntity> hotels;
  HotelsLoading({required this.hotels});
}

class ClassicalLoading extends HomeState {
  final List<ClassicalEntity> classical;
  ClassicalLoading({required this.classical});
}

class RivieraLoading extends HomeState {
  final List<RivieraEntity> riviera;

  RivieraLoading({required this.riviera});
}
