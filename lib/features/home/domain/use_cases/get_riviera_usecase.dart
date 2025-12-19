import '../entities/riviera_entity.dart';
import '../repositories/home_repository.dart';
class GetRivieraUseCase {

  final HomeRepository repo;
  GetRivieraUseCase(this.repo);
  Future<List<RivieraEntity>> call()=>repo.getRivieraHighlights();

}