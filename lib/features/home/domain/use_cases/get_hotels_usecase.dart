import 'package:amun/features/home/domain/repositories/home_repository.dart';
import '../entities/hotel_entity.dart';
class GetHotelsUseCase {
  final HomeRepository repo;
  GetHotelsUseCase(this.repo);
  Future<List<HotelEntity>> call()=>repo.getHotels();
}