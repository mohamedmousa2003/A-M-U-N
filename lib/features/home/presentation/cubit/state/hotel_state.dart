import 'package:amun/features/home/domain/entities/hotel_entity.dart';

abstract class  HotelState {}

class InitialHotelState extends HotelState{}
class ErrorHotelState extends HotelState{
  final String error;
  ErrorHotelState({required this.error});
}
class LoadingHotelState extends HotelState{}
class LoadedHotelState extends HotelState{
  final List<HotelEntity> hotel;
  LoadedHotelState({required this.hotel});
}
