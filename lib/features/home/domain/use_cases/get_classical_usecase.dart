import 'package:amun/features/home/domain/entities/classical_entity.dart';
import '../repositories/home_repository.dart';
class GetClassicalUseCase {
  final HomeRepository repo;
  GetClassicalUseCase(this.repo);
  Future<List<ClassicalEntity>> call() => repo.getClassicalHighlights();
}
