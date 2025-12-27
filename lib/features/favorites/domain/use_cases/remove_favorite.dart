import '../repositories/favorite_repository.dart';

class RemoveFavoriteUseCase {
  final FavoriteRepository repo;
  RemoveFavoriteUseCase(this.repo);

  void call(String id) {
    repo.removeFromFavorites(id);
  }
}
