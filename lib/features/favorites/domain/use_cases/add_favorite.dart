import '../entities/favorite_item.dart';
import '../repositories/favorite_repository.dart';

class AddFavoriteUseCase {
  final FavoriteRepository repo;
  AddFavoriteUseCase(this.repo);

  void call(FavoriteItem item) {
    repo.addToFavorites(item);
  }
}
