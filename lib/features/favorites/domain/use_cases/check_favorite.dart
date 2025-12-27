import '../repositories/favorite_repository.dart';

class IsFavoriteUseCase {
  final FavoriteRepository repo;
  IsFavoriteUseCase(this.repo);

  bool call(String id) {
    return repo.isFavorite(id);
  }
}
