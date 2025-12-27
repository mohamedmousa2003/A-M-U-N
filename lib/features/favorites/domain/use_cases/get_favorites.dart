import '../entities/favorite_item.dart';
import '../repositories/favorite_repository.dart';

class GetFavorites {
  final FavoriteRepository repo;
  GetFavorites(this.repo);

  List<FavoriteItem> call() => repo.getFavorites();

}