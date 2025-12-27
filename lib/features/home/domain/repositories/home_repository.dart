import '../entities/classical_entity.dart';
import '../entities/hotel_entity.dart';
import '../entities/riviera_entity.dart';
abstract class HomeRepository {
  Future<List<HotelEntity>> getHotels();
  Future<List<ClassicalEntity>> getClassicalHighlights();
  Future<List<RivieraEntity>> getRivieraHighlights();
  // List<ClassicalEntity> getFavorites();
}