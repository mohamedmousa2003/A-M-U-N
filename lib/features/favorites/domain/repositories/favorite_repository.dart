import '../entities/favorite_item.dart';

abstract class FavoriteRepository {
  void addToFavorites(FavoriteItem item);
  void removeFromFavorites(String id);
  bool isFavorite(String id);
  List<FavoriteItem> getFavorites();
}
