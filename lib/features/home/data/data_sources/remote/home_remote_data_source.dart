import '../../models/classical_model.dart';
import '../../models/hotel_model.dart';
import '../../models/riviera_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HotelModel>> getHotels();
  Future<List<ClassicalModel>> getClassicalHighlights();
  Future<List<TouristPlace>> getRivieraHighlights();
}